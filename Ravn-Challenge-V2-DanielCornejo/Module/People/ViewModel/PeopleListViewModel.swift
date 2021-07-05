//
//  PeopleListViewModel.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import Combine
import CombineExt
import Foundation

final class PeopleListViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = .init()
    private let service: StarWarsServiceType
    
    // Input.
    private let fetchAllPeopleRequest = PassthroughRelay<Void>()
    private let fetchMorePeopleRequest = PassthroughRelay<PageInfo?>()
    
    // Output.
    @Published var people: [Person] = []
    @Published var showMessage: Bool = false
    @Published var isLoading: Bool = true
    @Published var pageInfo: PageInfo?
    
    init(service: StarWarsServiceType = StarWarsService()) {
        self.service = service
        
        /// Input
        let allPeopleResponse = fetchAllPeopleRequest
            .flatMapLatest { [service] _ in
                service.fetchFirstPeople().materialize()
            }
            .share()
        
        let morePeopleResponse = fetchMorePeopleRequest
            .flatMapLatest { [service] pageInfo in
                service.fetchMorePeople(using: pageInfo?.endCursor).materialize()
            }
            .share()
        
        /// Output
        allPeopleResponse
            .values()
            .compactMap { $0.people }
            .assign(to: \.people, on: self, ownership: .weak)
            .store(in: &cancellables)
        
        morePeopleResponse
            .values()
            .compactMap { $0.people }
            .sink { [weak self] newPeople in
                self?.people.append(contentsOf: newPeople)
            }
            .store(in: &cancellables)
        
        Publishers.Merge(allPeopleResponse.values(), morePeopleResponse.values())
            .map { $0.pageInfo }
            .assign(to: \.pageInfo, on: self, ownership: .weak)
            .store(in: &cancellables)
        
        Publishers.Merge4(fetchAllPeopleRequest.map { true },
                          fetchMorePeopleRequest.map { _ in true },
                          allPeopleResponse.map { _ in false },
                          morePeopleResponse.map { _ in false })
            .assign(to: \.isLoading, on: self, ownership: .weak)
            .store(in: &cancellables)
        
        Publishers.Merge4(fetchAllPeopleRequest.map { false },
                          fetchMorePeopleRequest.map { _ in false },
                          allPeopleResponse.failures().map { _ in true },
                          morePeopleResponse.failures().map { _ in true })
            .assign(to: \.showMessage, on: self, ownership: .weak)
            .store(in: &cancellables)
    }
    
    // MARK: -Methods.
    func fetchAllPeople() {
        fetchAllPeopleRequest.accept(())
    }
    
    func fetchNextPeople(after person: Person) {
        if person.id == people.last?.id, pageInfo?.hasNextPage == true {
            fetchMorePeopleRequest.accept(pageInfo)
        }
    }
    
}

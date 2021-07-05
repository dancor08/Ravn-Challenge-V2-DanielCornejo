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
    
    // Output.
    @Published var people: [Person] = []
    @Published var showMessage: Bool = false
    @Published var isLoading: Bool = true
    
    init(service: StarWarsServiceType = StarWarsService()) {
        self.service = service
        
        let allPeopleResponse = fetchAllPeopleRequest
            .flatMapLatest { [service] _ in
                service.fetchAllPeople().materialize()
            }
            .share()
        
        allPeopleResponse
            .values()
            .assign(to: \.people, on: self, ownership: .weak)
            .store(in: &cancellables)
        
        Publishers.Merge(fetchAllPeopleRequest.map { true }, allPeopleResponse.map { _ in false })
            .assign(to: \.isLoading, on: self, ownership: .weak)
            .store(in: &cancellables)
        
        Publishers.Merge(fetchAllPeopleRequest.map { false }, allPeopleResponse.failures().map { _ in true })
            .assign(to: \.showMessage, on: self, ownership: .weak)
            .store(in: &cancellables)
    }
    
    // MARK: -Methods.
    func fetchAllPeople() {
        fetchAllPeopleRequest.accept(())
    }
    
}

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
    @Published var errorMessage: String = ""
    
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

        allPeopleResponse
            .failures()
            .map { $0.message }
            .assign(to: \.errorMessage, on: self, ownership: .weak)
            .store(in: &cancellables)
    }
    
    // MARK: -Methods.
    func fetchAllPeople() {
        fetchAllPeopleRequest.accept(())
    }
    
}

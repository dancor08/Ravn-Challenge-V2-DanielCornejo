//
//  StarWarsService.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import Combine
import Foundation

protocol StarWarsServiceType {
    func fetchAllPeople() -> AnyPublisher<[Person], ApolloServiceError>
}

struct StarWarsService: StarWarsServiceType {
    
    private let service: ApolloServiceType
    
    // MARK: - Init
    init(service: ApolloServiceType = ApolloService()) {
        self.service = service
    }
    
    // MARK: - StarWarsServiceType
    func fetchAllPeople() -> AnyPublisher<[Person], ApolloServiceError> {
        service.fetch(StarWarsPeopleQuery())
            .compactMap { $0.allPeople?.people?.compactMap { $0?.jsonObject } }
            .tryCompactMap {
                try JSONSerialization.data(withJSONObject: $0, options: .withoutEscapingSlashes)
            }
            .decode(type: [Person].self, decoder: JSONDecoder())
            .mapError { ApolloServiceError(message: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }
    
}

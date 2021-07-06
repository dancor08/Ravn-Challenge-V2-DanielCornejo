//
//  StarWarsServiceMock.swift
//  Ravn-Challenge-V2-DanielCornejoTests
//
//  Created by Daniel Cornejo on 7/5/21.
//

import Apollo
import Combine
import Foundation
@testable import Ravn_Challenge_V2_DanielCornejo

class StarWarsServiceMock: StarWarsServiceType {
    
    // MARK: Variables Declaration
    let shouldFail: Bool
    
    // MARK: Initializer
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    // MARK: Public Methods
    func fetchFirstPeople() -> AnyPublisher<AllPeople, ApolloServiceError> {
        if shouldFail {
            return Fail(error: ApolloServiceError(message: "This failed!"))
                .eraseToAnyPublisher()
        } else {
            let pageInfo = PageInfo(hasNextPage: true, endCursor: nil)
            let people: [Person] = [.init(id: "0001", name: "Human01"),
                                    .init(id: "0002", name: "Human02"),
                                    .init(id: "0003", name: "Human03"),]
            
            return Just(AllPeople(pageInfo: pageInfo, people: people))
                .setFailureType(to: ApolloServiceError.self)
                .eraseToAnyPublisher()
        }

    }
    
    func fetchMorePeople(using cursor: String?) -> AnyPublisher<AllPeople, ApolloServiceError> {
        if shouldFail {
            return Fail(error: ApolloServiceError(message: "This failed!"))
                .eraseToAnyPublisher()
        } else {
            let pageInfo = PageInfo(hasNextPage: true, endCursor: nil)
            let people: [Person] = [.init(id: "0004", name: "Human04"),
                                    .init(id: "0005", name: "Human05"),
                                    .init(id: "0006", name: "Human06"),]
            
            return Just(AllPeople(pageInfo: pageInfo, people: people))
                .setFailureType(to: ApolloServiceError.self)
                .eraseToAnyPublisher()
        }
    }
}

extension Person {
    init(id: String, name: String) {
        self.init(birthYear: nil,
                  eyeColor: nil,
                  hairColor: nil,
                  homeworld: nil,
                  id: id,
                  name: name,
                  skinColor: nil,
                  species: nil,
                  vehicleConnection: nil)
    }
}

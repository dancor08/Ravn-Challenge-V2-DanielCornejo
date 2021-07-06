//
//  ApolloServiceMock.swift
//  Ravn-Challenge-V2-DanielCornejoTests
//
//  Created by Daniel Cornejo on 7/5/21.
//
import Apollo
import Combine
import Foundation
@testable import Ravn_Challenge_V2_DanielCornejo

class ApolloServiceMock: ApolloServiceType {
    
    // MARK: Variables Declaration
    let shouldFail: Bool
    
    // MARK: Initializer
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    // MARK: Public Methods
    func fetch<T: GraphQLQuery>(_ query: T) -> AnyPublisher<T.Data, ApolloServiceError> {
        if shouldFail {
            return Fail(error: ApolloServiceError(message: "This failed!"))
                .eraseToAnyPublisher()
        } else {
            let pageInfo = StarWarsPeopleQuery.Data.AllPerson.PageInfo(hasNextPage: true)
            let people: [StarWarsPeopleQuery.Data.AllPerson.Person] = [.init(id: "0001", name: "Human01"),
                                    .init(id: "0002", name: "Human02"),
                                    .init(id: "0003", name: "Human03"),]
            
            let data = StarWarsPeopleQuery.Data.AllPerson(pageInfo: pageInfo, people: people)
            return Just(StarWarsPeopleQuery.Data(allPeople: data) as! T.Data)
                .setFailureType(to: ApolloServiceError.self)
                .eraseToAnyPublisher()
        }
    }
}

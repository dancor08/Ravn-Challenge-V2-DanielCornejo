//
//  ApolloService.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import Apollo
import Combine
import Foundation

protocol ApolloServiceType {
    func fetch<T: GraphQLQuery>(_ query: T) -> AnyPublisher<T.Data, ApolloServiceError>
}

final class ApolloService: ApolloServiceType {
    
    static let shared = ApolloService()
    
    var endPoint: String {
        "https://swapi-graphql.netlify.app/.netlify/functions/index"
    }
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: endPoint)!)
    
    // MARK: - ApolloServiceType Protocol
    func fetch<T: GraphQLQuery>(_ query: T) -> AnyPublisher<T.Data, ApolloServiceError> {
        Future { [apollo] promise in
            apollo.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        promise(.success(data))
                    } else if let errors = graphQLResult.errors {
                        let message = errors.map(\.localizedDescription).joined(separator: "\n")
                        promise(.failure(ApolloServiceError(message: message)))
                    }
                case .failure(let error):
                    promise(.failure(ApolloServiceError(message: error.localizedDescription)))
                }
            }
        }
        .eraseToAnyPublisher()
    }

}

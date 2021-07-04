//
//  ApolloServiceError.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import Foundation

struct ApolloServiceError: Error {
    let message: String
    var error: String {
        localizedDescription
    }
}

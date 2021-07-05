//
//  Person.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import Apollo
import Foundation

struct AllPeople: Codable {
    let pageInfo: PageInfo
    let people: [Person]?
}

struct PageInfo: Codable {
    let hasNextPage: Bool?
    let endCursor: String?
}

struct Person: Codable {
    let birthYear: String?
    let eyeColor: String?
    let hairColor: String?
    let homeworld: Homeworld?
    let id: String
    let name: String?
    let skinColor: String?
    let species: Species?
    let vehicleConnection: Vehicles?
    
    /// Short description of this person species and homeworld
    var shortDescription: String {
        guard let home = homeworld?.name else { return "" }
        
        if let species = species?.name {
            return "\(species) from \(home)"
        } else {
            return "Human from \(home)"
        }
    }
}

struct Species: Codable {
    let id: String
    let name: String?
}

struct Homeworld: Codable {
    let id: String
    let name: String?
}

struct Vehicle: Codable {
    let id: String
    let name: String?
}

struct Vehicles: Codable {
    let vehicles: [Vehicle]?
}

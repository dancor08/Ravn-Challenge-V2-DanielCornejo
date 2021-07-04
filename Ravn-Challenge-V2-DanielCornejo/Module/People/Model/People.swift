//
//  People.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import Apollo
import Foundation

struct People: Codable {
    let birthYear: String?
    let eyeColor: String?
    let hairColor: String?
    let homeworld: Homeworld?
    let id: String
    let name: String?
    let skinColor: String?
    let species: Species?
    let vehicleConnection: Vehicles?
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

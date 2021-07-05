//
//  PersonDetailView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct PersonDetailView: View {
    
    let person: Person
    
    var body: some View {
        ScrollView {
            SectionHeaderView(headerTitle: "General Information")
            DataCellView(title: "Eye Color", subtitle: person.eyeColor ?? "")
            DataCellView(title: "Hair Color", subtitle: person.hairColor ?? "")
            DataCellView(title: "Skin Color", subtitle: person.skinColor ?? "")
            DataCellView(title: "Birth of Year", subtitle: person.birthYear ?? "")
            SectionHeaderView(headerTitle: "Vehicles")
            LazyVStack(alignment: .leading, spacing: .zero) {
                ForEach(person.vehicleConnection?.vehicles ?? .init(), id: \.id) { vehicle in
                    DataCellView(title: vehicle.name ?? "", subtitle: "")
                }
            }
        }
    }
}

struct PeopleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person(birthYear: "12May92",
                                        eyeColor: "Brown",
                                        hairColor: "Black",
                                        homeworld: nil,
                                        id: "04654235-9",
                                        name: "Daniel Cornejo",
                                        skinColor: "Brunette",
                                        species: nil,
                                        vehicleConnection: Vehicles(vehicles: [Vehicle(id: "000001", name: "Hyundai Elantra"), Vehicle(id: "000002", name: "Toyota Yaris")])))
    }
}

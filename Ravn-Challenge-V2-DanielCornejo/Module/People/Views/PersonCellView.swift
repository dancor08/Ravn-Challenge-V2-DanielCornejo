//
//  PersonCellView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct PersonCellView: View {
    let person: Person
    
    var body: some View {
        NavigationLink(destination: PersonDetailView(person: person)) {
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(person.name ?? "")
                                .modifier(TextStyle.h2Default)
                            Text(person.shortDescription)
                                .modifier(TextStyle.p1LowEmphasis)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 6.0)
                    }
                    .padding(16.0)
                    Divider()
                        .padding(.leading, 16.0)
                }
            }
            .background(Color.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct PersonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCellView(person: Person(birthYear: "12May92",
                                      eyeColor: "Brown",
                                      hairColor: "Black",
                                      homeworld: Homeworld(id: "001", name: "El Salvador"),
                                      id: "04654235-9",
                                      name: "Daniel Cornejo",
                                      skinColor: "Brunette",
                                      species: Species(id: "002", name: nil),
                                      vehicleConnection: Vehicles(vehicles: [Vehicle(id: "000001", name: "Hyundai Elantra"), Vehicle(id: "000002", name: "Toyota Yaris")])))
            .previewLayout(.sizeThatFits)
    }
}

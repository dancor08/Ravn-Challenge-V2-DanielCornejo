//
//  PeopleListView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct PeopleListView: View {
    @ObservedObject var viewModel: PeopleListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.people, id: \.id) { person in
                    VStack {
                        Text(person.name ?? "")
                            .font(.title2)
                        Text("\(person.species?.name ?? "") from \(person.homeworld?.name ?? "")")
                            .foregroundColor(.gray)
                    }

                }
            }
        }
        .onAppear(perform: viewModel.fetchAllPeople )
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView(viewModel: .init())
    }
}

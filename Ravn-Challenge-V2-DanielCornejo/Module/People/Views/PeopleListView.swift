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
        NavigationView {
            ScrollView {
                LazyVStack(spacing: .zero) {
                    ForEach(viewModel.people, id: \.id) { person in
                        PersonCellView(person: person)
                            .onAppear {
                                viewModel.fetchNextPeople(after: person)
                            }
                    }
                }
                if viewModel.isLoading {
                    LoadingCellView()
                }
                if viewModel.showMessage {
                    NoticeCellView()
                }
            }
            .navigationBarTitle("People of Star Wars", displayMode: .inline)
        }
        .modifier(NavBarStyle(backgroundColor: .black, titleColor: .white))
        .onAppear(perform: viewModel.fetchAllPeople )
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView(viewModel: .init())
    }
}

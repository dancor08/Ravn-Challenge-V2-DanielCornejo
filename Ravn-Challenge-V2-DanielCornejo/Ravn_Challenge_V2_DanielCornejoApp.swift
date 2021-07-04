//
//  Ravn_Challenge_V2_DanielCornejoApp.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

@main
struct Ravn_Challenge_V2_DanielCornejoApp: App {
    var body: some Scene {
        WindowGroup {
            PeopleListView(viewModel: .init())
        }
    }
}

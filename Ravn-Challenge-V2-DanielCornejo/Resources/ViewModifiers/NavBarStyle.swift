//
//  NavBarStyle.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct NavBarStyle: ViewModifier {
    // MARK: Initializer
    init(backgroundColor: UIColor?, titleColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 17, weight: .bold),
                                          .foregroundColor: titleColor]

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = titleColor
    }

    // MARK: Public Methods
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarStyle(_ style: NavBarStyle) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}


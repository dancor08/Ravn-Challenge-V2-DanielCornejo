//
//  TextStyle.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct TextStyle: ViewModifier {
    // MARK: Variables Declaration
    let font: Font
    let color: Color

    // MARK: Public Methods
    static func designSystem(font: Font, color: Color) -> TextStyle {
        TextStyle(font: font, color: color)
    }

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

extension TextStyle {
    static let h2Default = TextStyle(font: .system(size: 17, weight: .bold), color: .ravnBlack)
    static let h2LowEmphasis = TextStyle(font: .system(size: 17, weight: .bold), color: .textLight)
    static let h2HighEmphasis = TextStyle(font: .system(size: 17, weight: .bold), color: .textEmphasis)
    static let p1Default = TextStyle(font: .system(size: 14), color: .ravnBlack)
    static let p1LowEmphasis = TextStyle(font: .system(size: 14), color: .textLight)
}

extension Color {
    static let ravnBlack = Color("RavnBlack")
    static let textDark = Color("TextDark")
    static let textEmphasis = Color("TextEmphasis")
    static let textLight = Color("TextLight")
}

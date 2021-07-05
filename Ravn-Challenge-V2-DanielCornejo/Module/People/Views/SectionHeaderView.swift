//
//  SectionHeaderView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct SectionHeaderView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"General Information"/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.leading)
            .padding(.top, 32.0)
            .padding(.horizontal, 16.0)
            .padding(.bottom, 8.0)
            .modifier(TextStyle.h2Default)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView()
            .previewLayout(.sizeThatFits)
    }
}

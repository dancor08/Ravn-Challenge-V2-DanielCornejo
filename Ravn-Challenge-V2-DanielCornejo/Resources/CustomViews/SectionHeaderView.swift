//
//  SectionHeaderView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct SectionHeaderView: View {
    let headerTitle: String
    
    var body: some View {
        HStack {
            Text(headerTitle)
                .multilineTextAlignment(.leading)
                .padding(.top, 32.0)
                .padding(.horizontal, 16.0)
                .padding(.bottom, 8.0)
                .modifier(TextStyle.h2Default)
            Spacer()
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(headerTitle: "General Information")
            .previewLayout(.sizeThatFits)
    }
}

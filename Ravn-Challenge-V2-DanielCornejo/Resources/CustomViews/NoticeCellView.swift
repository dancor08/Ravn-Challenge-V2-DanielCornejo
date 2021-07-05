//
//  NoticeCellView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct NoticeCellView: View {
    var body: some View {
        Text("Failed to Load Data")
            .padding(16.0)
            .modifier(TextStyle.h2HighEmphasis)
    }
}

struct NoticeCellView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeCellView()
            .previewLayout(.sizeThatFits)
    }
}

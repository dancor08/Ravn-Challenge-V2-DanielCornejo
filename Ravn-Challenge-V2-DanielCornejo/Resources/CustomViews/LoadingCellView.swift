//
//  LoadingCellView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct LoadingCellView: View {
    var body: some View {
        HStack {
            ProgressView()
                .padding(.trailing, 5.0)
            Text("Loading")
                .modifier(TextStyle.h2LowEmphasis)
        }
        .padding(16.0)
    }
}

struct LoadingCell_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCellView()
            .previewLayout(.sizeThatFits)
    }
}

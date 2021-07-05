//
//  DataCellView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct DataCellView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .modifier(TextStyle.h2LowEmphasis)
                Spacer()
                Text(subtitle)
                    .modifier(TextStyle.h2Default)
            }
            .padding(16.0)
            Divider()
                .padding(.leading, 16.0)
        }
    }
}

struct DataCellView_Previews: PreviewProvider {
    static var previews: some View {
        DataCellView(title: "Eye Color", subtitle: "Brown")
            .previewLayout(.sizeThatFits)
    }
}

//
//  PersonCellView.swift
//  Ravn-Challenge-V2-DanielCornejo
//
//  Created by Daniel Cornejo on 7/4/21.
//

import SwiftUI

struct PersonCellView: View {
    
    let name: String
    let description: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                            .modifier(TextStyle.h2Default)
                        Text(description)
                            .modifier(TextStyle.p1LowEmphasis)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(16.0)
                Divider()
                    .padding(.leading, 16.0)
            }
        }
    }
}

struct PersonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCellView(name: "Daniel Cornejo", description: "Human for El Salvador")
            .previewLayout(.sizeThatFits)
    }
}

//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    
    var body: some View {
        Button{
            isSet.toggle()
        }label: {
            Label("Toggle Visited", systemImage: isSet ? "checkmark.seal.fill": "seal")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .red: .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet:  .constant(true))
    }
}

//
//  LandMarkRows.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

struct LandMarkRow: View {
    var landmark: Landmark
    @Binding var darkModeEnabled: Bool;
    var body: some View {
        
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
                .foregroundColor(darkModeEnabled ? Color(.white) : Color(.black))

            Spacer()
            if landmark.isFavorite{
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
        }
        .listRowBackground(darkModeEnabled ? Color("darkMode") : Color("lightMode"))
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        let darkModeEnabled = Binding<Bool>(
            get: {return true},
            set: { _ in }
        )
        
        LandMarkRow(landmark:landmarks[0],darkModeEnabled:darkModeEnabled)
    }
}

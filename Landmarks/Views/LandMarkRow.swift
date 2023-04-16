//
//  LandMarkRows.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

struct LandMarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
            LandMarkRow(landmark:landmarks[0])
    }
}

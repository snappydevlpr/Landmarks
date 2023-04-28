//
//  LandmarkGridCard.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/26/23.
//

import SwiftUI

struct LandmarkGridCard: View {
    var landmark: Landmark
    @Binding var darkModeEnabled: Bool;
    var body: some View {
        
        VStack(alignment: .leading){
            landmark.image
                .resizable()
                .frame(width:200, height: 150)
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(.red)
                .offset(y: -150)
            Text(landmark.name)
                
            Text(landmark.park)
                .font(.subheadline)
        }
        .padding()
    }
}

struct LandmarkGridCard_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        let darkModeEnabled = Binding<Bool>(
            get: {return true},
            set: { _ in }
        )
        LandmarkGridCard(landmark: landmarks[0], darkModeEnabled: darkModeEnabled)
    }
}

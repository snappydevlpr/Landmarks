//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData:ModelData
    @Binding var darkModeEnabled: Bool;
    var landmark :Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView{
            MapsView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges:.top)
                .frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(darkModeEnabled ? Color(.white) : Color(.black))

                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                        .foregroundColor(darkModeEnabled ? Color(.white) : Color(.black))

                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .foregroundColor(darkModeEnabled ? Color(.white) : Color(.black))

                }
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                    .foregroundColor(darkModeEnabled ? Color(.white) : Color(.black))

                Text(landmark.description)
                    .foregroundColor(darkModeEnabled ? Color(.white) : Color(.black))

            }
            .padding()
            Spacer()
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .background(darkModeEnabled ? Color("darkMode") : Color("lightMode"))

    }
    
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        let darkModeEnabled = Binding<Bool>(
            get: {return true},
            set: { _ in }
        )
        
        LandmarkDetail(darkModeEnabled: darkModeEnabled, landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}

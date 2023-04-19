//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var filterByState = false;
    @State private var showFavoritesOnly=false;
    @State private var stateSelected = "";
    
    var filteredLandmarks: [Landmark]{
        if(filterByState){
            return modelData.landmarks.filter{landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
        if(showFavoritesOnly){
           return modelData.landmarks.filter{landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
        return modelData.landmarks
    }
    
    var body: some View {
        NavigationView{
            List {
                HStack {
                    NavigationLink{
                        ListFilters(showFavoritesOnly: $showFavoritesOnly, filterByState: $filterByState, stateSelected: $stateSelected)
                    }label: {
                        HStack {
                            Spacer()
                            Text("Filters")
                        }
                    }
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandMarkRow(landmark: landmark)
                    }
                    
                }
            }
            .navigationTitle("Landmarks")
        }
     
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkList()
            .environmentObject(modelData)
    }
}

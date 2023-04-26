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
    @State private var darkModeEnabled = false;
    
    var filteredLandmarks: [Landmark]{
        if(filterByState && showFavoritesOnly){
            return modelData.landmarks.filter{landmark in
                (landmark.isFavorite && stateSelected == landmark.state)
            }
        }
        if(filterByState){
            return modelData.landmarks.filter{landmark in
                (stateSelected == landmark.state)
            }
        }
        if(showFavoritesOnly){
           return modelData.landmarks.filter{landmark in
                (landmark.isFavorite)
            }
        }
        return modelData.landmarks
    }
    
    var body: some View {
           
            NavigationView{
                ZStack{
                    Color(darkModeEnabled ? "darkMode" : "lightMode")
                        .ignoresSafeArea(.all)
                    
                    VStack{
                        HStack {
                            Text("Landmarks")
                                .font(.title)
                                .foregroundColor(darkModeEnabled ? .white : .black)
                            Spacer()
                            NavigationLink{
                                ListFilters(showFavoritesOnly: $showFavoritesOnly, filterByState: $filterByState, stateSelected: $stateSelected, darkMode: $darkModeEnabled)
                            }label: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                            }
                        }
                        .padding()
                        
                        List {
                            ForEach(filteredLandmarks){ landmark in
                                NavigationLink{
                                    LandmarkDetail(darkModeEnabled: $darkModeEnabled,landmark: landmark)
                                } label: {
                                    LandMarkRow(landmark: landmark, darkModeEnabled: $darkModeEnabled)
                                }
                                .listRowBackground(darkModeEnabled ? Color(.black) : Color("lightMode"))

                            }

                        }
                        .background(darkModeEnabled ? Color(.black) : Color("lightMode"))

                        .scrollContentBackground(.hidden)

                        Button("Add a New Landmark") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        
                        
                    }
                }
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

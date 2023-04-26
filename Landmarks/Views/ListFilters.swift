//
//  ListFilters.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

struct ListFilters: View {
    @Binding var showFavoritesOnly:Bool;
    @Binding var filterByState:Bool;
    @Binding var stateSelected:String;
    @Binding var darkMode:Bool;
    
    var body: some View {
        VStack{
            Toggle(isOn: $showFavoritesOnly){
                Text("Visited Only: ")
            }
            .padding()
            VStack{
                Toggle(isOn: $filterByState){
                    Text("Filter By State: ")
                }
                HStack{
                    Text("By State: ")
                        .foregroundColor(filterByState ? .black: .gray)
                    Spacer()
                    Picker("State", selection: $stateSelected) {
                        ForEach(stateNames,id: \.self){ state in
                            Text(state)
                        }
                    }
                    .disabled(!filterByState)
                }
            }
            .padding()
            Divider()
            Toggle(isOn: $darkMode){
                HStack{
                    Image(systemName: "moon")
                    Text("Dark Mode")
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct ListFilters_Previews: PreviewProvider {

    static var previews: some View {
        let showFavoritesOnly = Binding<Bool>(
            get: { return true },
            set: { _ in }
        )
        
        let filterByState = Binding<Bool>(
            get: { return true },
            set: { _ in }
        )
        
        let stateSelected = Binding<String>(
            get: {return ""},
            set: { _ in }
        )
        let darkMode = Binding<Bool>(
            get: {return true},
            set: { _ in }
        )
            ListFilters(showFavoritesOnly: showFavoritesOnly, filterByState: filterByState, stateSelected: stateSelected, darkMode: darkMode)
    }
}

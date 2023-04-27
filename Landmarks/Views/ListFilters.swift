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
    @Binding var ViewOption:Int;
    var body: some View {
        VStack{
            Picker("View Options", selection: $ViewOption ) {
                Text("List").tag(0)
                Text("Grid").tag(1)
            }
            .pickerStyle(.segmented)
            VStack{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Visited Only: ")
                        .foregroundColor(darkMode ? .white : .black)
                }
                Toggle(isOn: $filterByState){
                    Text("Filter By State: ")
                        .foregroundColor(darkMode ? .white : .black)

                }
                HStack{
                    Text("By State: ")
                        .foregroundColor(filterByState ? darkMode ? .white : .gray : .gray)
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
                .background(.black)
            Toggle(isOn: $darkMode){
                HStack{
                    Image(systemName: "moon")
                        .foregroundColor(darkMode ? .white : .black)
                    Text("Dark Mode")
                        .foregroundColor(darkMode ? .white : .black)

                }
            }
            .padding()
            Spacer()
        }
        .padding()
        .background(darkMode ? Color("darkMode") : Color("lightMode"))
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
        
        let ViewOption = Binding<Int>(
            get: {return 0},
            set: { _ in }
        )
        
        ListFilters(showFavoritesOnly: showFavoritesOnly, filterByState: filterByState, stateSelected: stateSelected, darkMode: darkMode, ViewOption: ViewOption)
    }
}

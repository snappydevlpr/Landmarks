//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

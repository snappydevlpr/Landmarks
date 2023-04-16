//
//  MapsView.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import SwiftUI
import MapKit


struct MapsView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate:CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView(coordinate: CLLocationCoordinate2D(latitude: 33.85, longitude: -115.80))
    }
}

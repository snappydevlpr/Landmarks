//
//  CircleImage.swift
//  Landmarks
//
//  Created by Austin Suarez on 4/16/23.
//

import Foundation
import SwiftUI

struct CircleImage:View{
    var image:Image
    
    var body: some View{
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white,lineWidth: 4.0)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider{
    static var previews: some View{
        CircleImage(image: Image("turtlerock"))
    }
}

//
//  CircleImageView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    
    var body: some View {
        
        ZStack {
            Color("Primary Dark Blue").ignoresSafeArea()
            
            image.clipShape(Circle())
                .overlay(Circle().stroke(Color("Primary Blue"), lineWidth: 8))
                .shadow(radius: 14)
        }
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("splashIcon"))
    }
}

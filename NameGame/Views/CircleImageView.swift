//
//  CircleImageView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct CircleImageView: View {
    
    var image: Image
    var strokeColor: Color = Color(CustomColor.primaryBlueBtn.rawValue)
    var strokeWidth: CGFloat = 8
    var shadowRadius:  CGFloat = 14
    
    var body: some View {
        image.clipShape(Circle())
            .overlay(Circle().stroke(strokeColor, lineWidth: shadowRadius))
            .shadow(radius: shadowRadius)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("splashIcon"), strokeColor: Color(CustomColor.primaryBlue.rawValue), strokeWidth: 8, shadowRadius: 14)
    }
}

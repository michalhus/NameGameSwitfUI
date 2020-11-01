//
//  SplashView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct SplashView: View {
    
    @State var animate:Bool = false
    
    var body: some View {
        VStack {
            if self.animate {
                HomeView()
            } else {
                CircleImageView(image: Image("splashIcon"))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.animate = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}



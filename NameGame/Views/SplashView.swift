//
//  SplashView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct SplashView: View {
    @State var endSplash: Bool = false
    var splashImage: Image = Image("splashIcon")
    
    var body: some View {
                                
            ZStack {
                Color("Primary Dark Blue").ignoresSafeArea()
                CircleImageView(image: splashImage)
                
                if endSplash {
                    MainMenuView()
                }
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: {
                splashDelay()
            })
            .phoneOnlyStackNavigationView()
    }
    
    func splashDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(Animation.linear(duration: 1.00)) {
                endSplash.toggle()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewDevice("iPhone 11 Pro Max")
            .previewLayout(.device)
    }
}

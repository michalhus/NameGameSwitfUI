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
                Color(CustomColor.primaryDarkBlue.rawValue).ignoresSafeArea()
                CircleImageView(image: splashImage)
                
                if endSplash {
                    MainMenuView().navigationViewStyle(StackNavigationViewStyle())
                        .navigationBarHidden(true)
                }
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: {
                splashDelay()
            })
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)

    }
    
    func splashDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(Animation.linear(duration: 1.00)) {
                endSplash.toggle()
            }
        }
    }
}

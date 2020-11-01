//
//  SplashView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct SplashView: View {
    
    @State var animate: Bool = false
    @State var endSplash: Bool = false
    var splashImage: Image = Image("splashIcon")
    
    var body: some View {
        
        ZStack {
            MainMenuView()
            
            ZStack {
                Color("Primary Dark Blue").ignoresSafeArea()
                
                splashImage.resizable()
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil :  /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: animate ? nil : /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .scaleEffect(animate ? 3: 1)
                    .frame(width: UIScreen.main.bounds.width)
                CircleImageView(image: splashImage)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: {
                splashAnimation()
            })
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func splashAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(Animation.easeIn(duration: 0.45)) {
                animate.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.35)) {
                endSplash.toggle()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

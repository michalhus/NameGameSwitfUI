//
//  ContentView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack {
            List(0..<5) { i in
                Text("Item - \(i)")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}



//struct ContentView: View {
//  @State var showSplash = true
//
//  var body: some View {
//    ZStack{
//      MapView(coordinate: CLLocationCoordinate2DMake(37.331820, -122.03118))
//        .edgesIgnoringSafeArea(.all)
//      SplashScreen()
//        .opacity(showSplash ? 1 : 0)
//        .onAppear {
//          DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            SplashScreen.shouldAnimate = false
//            withAnimation() {
//              self.showSplash = false
//            }
//          }
//      }
//    }
//  }
//}

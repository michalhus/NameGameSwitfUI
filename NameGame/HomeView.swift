//
//  HomeView.swift
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

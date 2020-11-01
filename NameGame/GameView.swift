//
//  GameView.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        
        VStack {
            List(0..<5) { i in
                Text("Item - \(i)")
            }
        }    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

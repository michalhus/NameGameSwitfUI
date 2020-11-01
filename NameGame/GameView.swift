//
//  GameView.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import SwiftUI

struct GameView: View {
    var gameMode: GameModeType
    
    var body: some View {
            VStack {
                List(0..<5) { i in
                    Text("Item - \(i)")
                }
                
            }
            .navigationBarTitle(Text(gameMode.rawValue), displayMode: .inline)
            .navigationBarItems(trailing: gameMode.rawValue == "Timed Mode" ?
                                    CountdownView().padding(.trailing, 5) : nil)
            .phoneOnlyStackNavigationView()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameMode: .practiceMode)
    }
}

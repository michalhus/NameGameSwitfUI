//
//  MainMenuView.swift
//  NameGame
//
//  Created by Michal Hus on 10/31/20.
//

import SwiftUI

struct MainMenuView: View {
    private let viewModel = GameViewModel()
    var splashImage: Image = Image("splashIcon")
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color("Primary Dark Blue").ignoresSafeArea()
                
                VStack {
                    CircleImageView(image: splashImage)
                    
                    VStack {
                        Text("Try matching the WillowTree employee to their photo")
                            .font(Font.body.leading(.loose))
                            .font(.custom("SFProText-Regular", size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 281.0, height: 83.0)
                            .padding(12)
                        
                        NavigationLink(destination: GameView(gameMode: GameModeType.practiceMode)) {
                            Text(GameModeType.practiceMode.rawValue)
                                .foregroundColor(.white)
                                .frame(width: 359, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color("Primary Blue Button"))
                                .cornerRadius(14)
                                .padding(4)
                        }
                        
                        NavigationLink(destination: GameView(gameMode: GameModeType.timedMode)) {
                            Text(GameModeType.timedMode.rawValue)
                                .foregroundColor(.white)
                                .frame(width: 359, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color("Primary Blue Button"))
                                .cornerRadius(14)
                                .padding(4)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

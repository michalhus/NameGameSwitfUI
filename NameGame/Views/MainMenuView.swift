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
                Color(CustomColor.primaryDarkBlue.rawValue).ignoresSafeArea()
                
                VStack {
                    CircleImageView(image: splashImage).padding(.top, 2)
                    
                    VStack {
                        Text("Try matching the WillowTree employee to their photo")
                            .font(Font.body.leading(.loose))
                            .font(.custom(CustomFont.proTextRegular.rawValue, size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 281.0, height: 76.0)
                            .padding(0)
                        
                        NavigationLink(destination: GameView(gameMode: GameModeType.practiceMode)) {
                            Text(GameModeType.practiceMode.rawValue)
                                .foregroundColor(.white)
                                .frame(width: 359, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color(CustomColor.primaryBlueBtn.rawValue))
                                .cornerRadius(14)
                                .padding(.bottom, 2)
                        }
                        
                        NavigationLink(destination: GameView(gameMode: GameModeType.timedMode)) {
                            Text(GameModeType.timedMode.rawValue)
                                .foregroundColor(.white)
                                .frame(width: 359, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color(CustomColor.primaryBlueBtn.rawValue))
                                .cornerRadius(14)
                                .padding(.bottom, 2)
                        }
                    }
                    .padding(.bottom, 6)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

//
//  GameView.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import SwiftUI

struct GameView: View {

    @State private var isAlert: Bool = false
    @ObservedObject var viewModel = GameViewModel.shared
    var gameMode: GameModeType
    
    var body: some View {
            VStack {
                Text(viewModel.targetProfile)
                    .onAppear{self.viewModel.fetchProfiles()}
                    .font(.largeTitle)
                    .padding()
         
                let columns: [GridItem] =
                        Array(repeating: .init(.flexible()), count: 2)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.profileViewModels) { profile in
                            if let headshot = profile.headshot, let url = URL(string: headshot) { 
                                AsyncProfileView(
                                        url: url,
                                        placeholder: { PlaceholderView() },
                                        profile: profile.name,
                                        isAlert: $isAlert
                                )
                                .frame(idealHeight: UIScreen.main.bounds.width / 2)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text(gameMode.rawValue), displayMode: .inline)
            .navigationBarItems(trailing: gameMode.rawValue == "Timed Mode" ? TimerView(isAlert: $isAlert).padding(.trailing, 5) : nil)
            .phoneOnlyStackNavigationView()
    }
}

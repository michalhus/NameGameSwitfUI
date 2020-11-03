//
//  GameView.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//
import SwiftUI

struct GameView: View {
    @ObservedObject private var viewModel = GameViewModel()
    var gameMode: GameModeType
    
    var body: some View {
            VStack {
                Text(viewModel.targetProfile)
                    .onAppear{self.viewModel.fetchProfiles()}
                    .font(.largeTitle)

                let columns: [GridItem] =
                        Array(repeating: .init(.flexible()), count: 2)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.profileViewModels) { profile in
                            if let url = URL(string: profile.headshot) {
                                AsyncProfileView(
                                        url: url,
                                        placeholder: { Text("Loading ...") }
                                     )
                                .frame(idealHeight: UIScreen.main.bounds.width / 2)
                            }
                        }
                    }.font(.largeTitle).onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                        print("Tapped on the")
                    })
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
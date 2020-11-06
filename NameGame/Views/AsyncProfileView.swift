//
//  AsyncProfileView.swift
//  NameGame
//
//  Created by Michal Hus on 11/2/20.
//

import SwiftUI
import Combine

struct AsyncProfileView<Placeholder: View>: View {
    
    @Environment (\.presentationMode) var presentationMode
    @Binding var isAlert: Bool
    @State var initialProfile: Bool = true
    @State var tapped = false
    @ObservedObject private var viewModel = GameViewModel.shared
    @StateObject private var loader: ProfileLoader
    private let placeholder: Placeholder
    var profile: String
    var gameMode: GameModeType


    init(url: URL, @ViewBuilder placeholder: () -> Placeholder, profile: String, isAlert: Binding<Bool>, gameMode: GameModeType) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ProfileLoader(url: url))
        self._isAlert = isAlert
        self.profile = profile
        self.gameMode = gameMode
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
     }

    var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .clipShape(Circle())
                    .onTapGesture {
                        self.tapped = true
                        self.initialProfile = true
                    }
                    .overlay(
                        VStack {
                            if self.tapped && viewModel.isSelectedCorrect(profile)
                            {
                                
                                Image("successIcon")
                                    .resizable()
                                    .opacity(0.6)
                                    .clipShape(Circle())
                                    .onAppear {
                                        self.viewModel.score += 1
                                        self.initialProfile = false
                                    }.onChange(of: initialProfile) { newValue in
                                        self.viewModel.fetchProfiles()
                                    }

                                
                            } else if self.tapped && !viewModel.isSelectedCorrect(profile) && initialProfile {
                                Image("failureIcon")
                                    .resizable()
                                    .clipShape(Circle())
                                    .opacity(0.6)
                                    .onAppear() {
                                        if gameMode == GameModeType.practiceMode {
                                            isAlert = true
                                        }
                                    }
                            }
                        }
                    )
                    .alert(isPresented: $isAlert) {
                        return Alert(title: Text("Game Over"), message: Text("Scored: \(viewModel.score)"), dismissButton: .cancel(Text("OK")) {
                            self.viewModel.score = 0
                            self.presentationMode.wrappedValue.dismiss()
                        })
                    }
            } else {
                placeholder
            }
        }
    }
}

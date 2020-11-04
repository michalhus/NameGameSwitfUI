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
    @State var tapped = false
    @ObservedObject private var viewModel = GameViewModel.shared
    @StateObject private var loader: ProfileLoader
    private let placeholder: Placeholder
    private let profile: String
    var gameMode: GameModeType


    init(url: URL, @ViewBuilder placeholder: () -> Placeholder, profile: String, isAlert: Binding<Bool>, gameMode: GameModeType) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ProfileLoader(url: url))
        self.profile = profile
        self._isAlert = isAlert
        self.gameMode = gameMode
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
            .onTapGesture { self.tapped = true }
            .overlay(
                
//                { if isAlert ? {Text("Text")} : nil }
                
                VStack {
                    if tapped && viewModel.isSelectedCorrect(profile)
                    {
                        Image("successIcon")
                            .resizable()
                            .opacity(0.6)
                            .onAppear {
                                self.viewModel.fetchProfiles()
                                self.viewModel.score += 1
                            }
                    // TODO: case switch??? figure out logic first
                    } else if tapped && !viewModel.isSelectedCorrect(profile) && gameMode.rawValue == "Practice Mode" {
                        
                        Image("failureIcon")
                            .resizable()
                            .opacity(0.6)
                            .onAppear() { isAlert = true }
                            
                            .alert(isPresented: $isAlert) {
                                return Alert(title: Text("Game Over"), message: Text("Scored: \(viewModel.score)"), dismissButton: .cancel(Text("OK")) {
                                    self.viewModel.score = 0
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }
                        
                        
                    } else if tapped && !viewModel.isSelectedCorrect(profile) && gameMode.rawValue == "Timed Mode" {
                        
                        
                        // TODO: Fix so the timer affect timed mode for success no t on click
                        Image("failureIcon")
                            .resizable()
                            .opacity(0.6)
                            .alert(isPresented: $isAlert) {
                                return Alert(title: Text("Game Over"), message: Text("Scored: \(viewModel.score)"), dismissButton: .cancel(Text("OK")) {
                                    self.viewModel.score = 0
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }                    
                    }
                })
    }

    var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

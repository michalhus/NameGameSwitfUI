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
    @State var initialProflie: Bool = true
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
//            .overlay(
//                VStack {
//
//
//                    if isAlert {
////                        print("true")
//                    }
//
//
//                    if tapped && viewModel.isSelectedCorrect(profile)
//                    {
//
//                        Image("successIcon")
//                            .resizable()
//                            .opacity(0.6)
//                            .onAppear {
//                                self.viewModel.fetchProfiles()
//                                self.viewModel.score += 1
//                            }
//
//
//                    } else if tapped && !viewModel.isSelectedCorrect(profile){
//                        Image("failureIcon")
//                            .resizable()
//                            .opacity(0.6)
//                            .onAppear() {
//                                if gameMode.rawValue == "Practice Mode" {
//                                    isAlert = true
//                                }
//                            }
//                    }
//
//
//
//
//
//
//
//
//
//
//
//
//                }
//            )
            .alert(isPresented: $isAlert) {
                return Alert(title: Text("Game Over"), message: Text("Scored: \(viewModel.score)"), dismissButton: .cancel(Text("OK")) {
                    self.viewModel.score = 0
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
    }

    var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .onTapGesture {
                        self.tapped = true
                        self.initialProflie = true
                    }
                    .overlay(
                        VStack {
                            
                            
                            if isAlert {}
                            
                            
                            if self.tapped && viewModel.isSelectedCorrect(profile)
                            {
                                
                                Image("successIcon")
                                    .resizable()
                                    .opacity(0.6)
                                    .onAppear {
                                        self.viewModel.fetchProfiles()
                                        self.viewModel.score += 1
                                        self.initialProflie = false
                                    }.onChange(of: initialProflie) { newValue in
                                        print("Name changed to \(initialProflie)!")
                                    }
                                
                            } else if self.tapped && !viewModel.isSelectedCorrect(profile) && initialProflie {
                                Image("failureIcon")
                                    .resizable()
                                    .opacity(0.6)
                                    .onAppear() {
                                        if gameMode.rawValue == "Practice Mode" {
                                            isAlert = true
                                        }
                                    }
                            }
                        }
                    )
            } else {
                placeholder
            }
        }
    }
}

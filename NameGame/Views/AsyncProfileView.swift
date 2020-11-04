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

    init(url: URL, @ViewBuilder placeholder: () -> Placeholder, profile: String, isAlert: Binding<Bool>) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ProfileLoader(url: url))
        self.profile = profile
        self._isAlert = isAlert
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
            .onTapGesture { self.tapped = true }
            .overlay(
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
                    } else if tapped && !viewModel.isSelectedCorrect(profile) {
                        
                        Image("failureIcon")
                            .resizable()
                            .opacity(0.6)
                            .onAppear() { isAlert = true }
                            .alert(isPresented: $isAlert) {
                                return Alert(title: Text("Game Over"), message: Text("Scored: \(viewModel.score)"), dismissButton: .cancel(Text("OK")) {
                                                isAlert = false
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
//
//struct AsyncProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        if let url = URL(string: "https://images.ctfassets.net/3cttzl4i3k1h/4Mv2CONANym46UwuuCIgK/cbeb43c93a843a43c07b1de9954795e2/headshot_joel_garrett.jpg"){
//            AsyncProfileView(url: url, placeholder: { Text("Loading ...") }, profile: "", isAlert: $isAlert)
//        }
//    }
//}

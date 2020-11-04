//
//  AsyncProfileView.swift
//  NameGame
//
//  Created by Michal Hus on 11/2/20.
//

import SwiftUI
import Combine

struct AsyncProfileView<Placeholder: View>: View {
    @State var showOverlay = false
    @ObservedObject private var viewModel = GameViewModel.shared
    @StateObject private var loader: ProfileLoader
    private let placeholder: Placeholder
    private let profile: String


    init(url: URL, @ViewBuilder placeholder: () -> Placeholder, profile: String) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ProfileLoader(url: url))
        self.profile = profile
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
            .onTapGesture { self.showOverlay.toggle() }
            .overlay(
                VStack {
                    if self.showOverlay
                        &&
                        viewModel.isSelectedCorrect(selectedProfile: self.profile)
                    {
                        Image("successIcon")
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

struct AsyncProfileView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = URL(string: "https://images.ctfassets.net/3cttzl4i3k1h/4Mv2CONANym46UwuuCIgK/cbeb43c93a843a43c07b1de9954795e2/headshot_joel_garrett.jpg"){
            AsyncProfileView(url: url, placeholder: { Text("Loading ...") }, profile: "")
        }
    }
}

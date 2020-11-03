//
//  AsyncProfileView.swift
//  NameGame
//
//  Created by Michal Hus on 11/2/20.
//

import SwiftUI
import Combine

struct AsyncProfileView<Placeholder: View>: View {
    @StateObject private var loader: ProfileLoader
    private let placeholder: Placeholder

    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ProfileLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
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
            AsyncProfileView(url: url, placeholder: { Text("Loading ...") })
        }
    }
}

//
//  PlaceholderView.swift
//  NameGame
//
//  Created by Michal Hus on 11/4/20.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        VStack {
            ProgressView().padding()
            Text("Loading ...")
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}

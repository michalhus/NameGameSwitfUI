//
//  ProgressTrack.swift
//  NameGame
//
//  Created by Michal Hus on 11/4/20.
//

import SwiftUI

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 22, height: 22)
            .overlay(
                Circle().stroke(Color("Primary Light Blue Progress Bar"))
        )
    }
}

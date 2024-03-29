//
//  ClockView.swift
//  NameGame
//
//  Created by Michal Hus on 11/4/20.
//

import SwiftUI

struct ClockView: View {
    
    var counter: Int
    var countTo: Int

    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom(CustomFont.proTextRegular.rawValue, size: 8))
                .fontWeight(.black)
        }
    }

    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)

        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }

}

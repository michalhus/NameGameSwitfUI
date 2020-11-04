//
//  TimerView.swift
//  NameGame
//
//  Created by Michal Hus on 11/4/20.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct TimerView: View {
    @State var counter: Int = 0
    var countTo: Int = 60
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrackView()
                CircularProgressBarView(counter: counter, countTo: countTo)
                ClockView(counter: counter, countTo: countTo)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

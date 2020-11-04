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
    @Binding var isAlert: Bool
    @State var counter: Int = 0
    var countTo: Int = 5
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrackView()
                CircularProgressBarView(counter: counter, countTo: countTo)
                ClockView(counter: counter, countTo: countTo)
                
//                isAlert = true
                
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
//            if (counter == countTo) {
//                return isAlert = true
//            }
        }.alert(isPresented: $isAlert) {
            return Alert(title: Text("Game Over"), message: Text("Scored:"), dismissButton: .cancel(Text("OK")) { isAlert = false }
            )
        }
    }
}

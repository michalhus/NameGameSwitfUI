//
//  TimerView.swift
//  NameGame
//
//  Created by Michal Hus on 11/4/20.
//

import SwiftUI

struct TimerView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @Binding var isTimeOut: Bool
    @State var counter: Int = 0
    var countTo: Int = 5
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()

    
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
            if (counter == countTo) {
                self.timer.upstream.connect().cancel()
                return isTimeOut = true
            }
        }
//        .alert(isPresented: $isTimeOut) {
//            return Alert(title: Text("Game Over"), message: Text("Scored: "), dismissButton: .cancel(Text("OK")) {
////                self.viewModel.score = 0
//                self.presentationMode.wrappedValue.dismiss()
//            })
//        }
    }
}

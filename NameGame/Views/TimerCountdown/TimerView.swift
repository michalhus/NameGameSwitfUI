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
    @Environment(\.presentationMode) var presentationMode
    @Binding var isAlert: Bool
    @State var counter: Int = 0
    var countTo: Int = 5
    
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
                isAlert = true
            }
        }.alert(isPresented: $isAlert) {
            Alert(title: Text("Game Over"), message: Text("Scored:"), dismissButton: .default(Text("OK"))
                    { print("woowow")}
            )
        }
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView(isAlert: true)
//    }
//}


///struct PlayButton: View {
//    @Binding var isPlaying: Bool
//
//    var body: some View {
//        Button(action: {
//            self.isPlaying.toggle()
//        }) {
//            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
//        }
//    }
//}

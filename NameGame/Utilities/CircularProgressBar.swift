//
//  CircularProgressBar.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//
// LICENSED by https://marcgg.com/blog/2020/05/06/circular-progressbar-clock-swiftui/

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int

    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom("SFProText-Regular", size: 8))
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

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 22, height: 22)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round,
                            lineJoin:.round
                        )
                )
                    .foregroundColor(
                        (completed() ? Color.red : Color("Primary Blue Progress Bar"))
                ).animation(
                    .easeInOut(duration: 0.2)
                )
        )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct CountdownView: View {
    @State var counter: Int = 0
    var countTo: Int = 60
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
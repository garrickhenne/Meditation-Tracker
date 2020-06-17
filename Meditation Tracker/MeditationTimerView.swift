//
//  MeditationTimerView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-17.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct MeditationTimerView: View {
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        VStack {
            Text(convertSecondsToMinutesAndSeconds(seconds: timerManager.timeRemaining))
                .font(.custom("Avenir", size: 40))
                .padding(.top, 200)
                .padding(.bottom, 100)
            HStack {
                Button(action: {self.timerManager.start(from: 5*60)}) {
                    TimerButton(label: "5 Minutes", buttonColor: .blue)
                }
                Button(action: {self.timerManager.start(from: 10*60)}) {
                    TimerButton(label: "10 Minutes", buttonColor: .blue)
                }
            }
            .padding(.bottom)
            HStack {
                Button(action: {self.timerManager.start(from: 15*60)}) {
                    TimerButton(label: "15 Minutes", buttonColor: .blue)
                }
                Button(action: {self.timerManager.start(from: 20*60)}) {
                    TimerButton(label: "20 Minutes", buttonColor: .blue)
                }
            }
            .padding(.bottom)
            Button(action: { self.timerManager.pause() }) {
                TimerButton(label: "Pause", buttonColor: .yellow)
            }
            .padding(.bottom)
            Button(action: { self.timerManager.reset() }) {
                TimerButton(label: "Reset", buttonColor: .red)
            }
            Spacer()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationTimerView()
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .padding(20)
            .foregroundColor(.white)
            .background(buttonColor)
            .cornerRadius(10)
    }
}

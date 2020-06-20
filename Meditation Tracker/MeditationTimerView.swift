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
    
    // Switches Play button with Pause Button
    @State var isPlaying: Bool = false
    
    // MARK: Play/Pause Size constants
    private let pausePlayButtonSize: CGFloat = 80
    
    var body: some View {
        TabView {
            // MARK: Meditation Timer View
            VStack {
                Text(convertSecondsToMinutesAndSeconds(seconds: timerManager.timeRemaining))
                    .font(.custom("Avenir", size: 50))
                    .padding(.top, 200)
                    .padding(.bottom, 10)
                // TODO: - Add Animation on switches between pause and play.
                if !self.isPlaying {
                    Button(action: {
                        self.timerManager.fireTimer()
                        self.isPlaying = true
                    },
                           label: {
                            Image(systemName: "play.circle.fill").resizable().frame(width: pausePlayButtonSize, height: pausePlayButtonSize, alignment: .center)
                    })
                        .padding(.bottom)
                } else {
                    Button(action: {
                        self.timerManager.pause()
                        self.isPlaying = false
                    },
                           label: {
                            Image(systemName: "pause.circle.fill").resizable().frame(width: pausePlayButtonSize, height: pausePlayButtonSize, alignment: .center)
                    })
                        .padding(.bottom)
                }
                HStack {
                    Button(action: {
                        self.timerManager.setMeditationTime(from: 5*60)
                        // Sound here was for testing
                        playSound(sound: "applause", type: "mp3")
                    }) {
                        TimerButton(label: "5 Minutes", buttonColor: .blue)
                    }
                    
                    Button(action: {self.timerManager.setMeditationTime(from: 10*60)}) {
                        TimerButton(label: "10 Minutes", buttonColor: .blue)
                    }
                }
                .padding(.bottom)
                HStack {
                    Button(action: {self.timerManager.setMeditationTime(from: 15*60)}) {
                        TimerButton(label: "15 Minutes", buttonColor: .blue)
                    }
                    Button(action: {self.timerManager.setMeditationTime(from: 20*60)}) {
                        TimerButton(label: "20 Minutes", buttonColor: .blue)
                    }
                }
                .padding(.bottom)
                Spacer()
            }
             .tabItem {
                Image(systemName: "moon")
                Text("Meditate")
              }
            // MARK: - History View
            VStack {
                Text("Total Time Meditated: \(timerManager.totalMeditationTime)")
                Text("Welcome to the History View")
            }
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
            }
            // MARK: - Settings View
            Text("Welcome to the Settings View")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
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

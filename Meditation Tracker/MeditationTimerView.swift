//
//  MeditationTimerView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-17.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct MeditationTimerView: View {
    @EnvironmentObject var timerManager: TimerManager
    
    // Switches Play button with Pause Button
    @State var isPlaying: Bool = false
    
    // MARK: Play/Pause Size constants
    private let pausePlayButtonSize: CGFloat = 80
    
    var body: some View {
        TabView {
            // MARK: Meditation Timer View
            ZStack {
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(convertSecondsToMinutesAndSeconds(seconds: timerManager.timeRemaining))
                        .font(.custom("Avenir", size: 50))
                        .foregroundColor(Color(#colorLiteral(red: 0.9325308204, green: 0.423905015, blue: 0.3029931784, alpha: 1)))
                        .padding(.top, 200)
                        .padding(.bottom, 10)
                    HStack(spacing: 20) {
                        // TODO: - Add Animation on switches between pause and play.
                        if !self.isPlaying {
                            Button(action: {
                                self.timerManager.fireTimer()
                                self.isPlaying = true
                            },
                                   label: {
                                    Image(systemName: "play.circle.fill").resizable().frame(width: pausePlayButtonSize, height: pausePlayButtonSize, alignment: .center)
                            })
                        } else {
                            Button(action: {
                                self.timerManager.pause()
                                self.isPlaying = false
                            },
                                   label: {
                                    Image(systemName: "pause.circle.fill").resizable().frame(width: pausePlayButtonSize, height: pausePlayButtonSize, alignment: .center)
                            })
                        }
                        Button(action: {
                            self.timerManager.reset()
                            self.isPlaying = false
                        }, label: {
                            Image(systemName: "stop.circle.fill").resizable().frame(width: pausePlayButtonSize, height: pausePlayButtonSize, alignment: .center)
                        })
                    }
                    .padding()
                    HStack {
                        Button(action: {
                            self.timerManager.setMeditationTime(from: 5*60)
                            // Sound here was for testing
                            playSound(sound: "LowBowlPadBeatMidVel4", type: "mp3")
                        }) {
                            TimerButton(label: "5 Minutes")
                        }
                        
                        Button(action: {self.timerManager.setMeditationTime(from: 10*60)}) {
                            TimerButton(label: "10 Minutes")
                        }
                    }
                    .padding(.bottom)
                    HStack {
                        Button(action: {self.timerManager.setMeditationTime(from: 15*60)}) {
                            TimerButton(label: "15 Minutes")
                        }
                        Button(action: {self.timerManager.setMeditationTime(from: 20*60)}) {
                            TimerButton(label: "20 Minutes")
                        }
                    }
                    .padding(.bottom)
                    Spacer()
                }
            }
             .tabItem {
                Image(systemName: "moon")
                Text("Meditate")
            }
            // MARK: - History View
            HistoryTabView()
            .edgesIgnoringSafeArea(.all)
            .tabItem {
                Image(systemName: "clock")
                Text("History")
            }
            // MARK: - Settings View
            SettingsView()
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .accentColor(Color("paletteOrange"))
        .onAppear() {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationTimerView().environmentObject(TimerManager())
    }
}

struct TimerButton: View {
    
    let label: String
    
    var body: some View {
        Text(label)
            .padding(20)
            .foregroundColor(Color(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)))
            .background(Color(#colorLiteral(red: 0.9325308204, green: 0.423905015, blue: 0.3029931784, alpha: 1)))
            .cornerRadius(10)
            //.shadow(radius: 10)
    }
}

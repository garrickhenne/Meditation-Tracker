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
    
    @State var settingsInView: Bool = false
    
    @State var selectedSound: String = UserDefaults.standard.string(forKey: "finishedSound") ?? "LowBowlPadBeatMidVel4"
    
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
                    HStack {
                        Button(action: {
                            self.settingsInView = true
                        }) {
                            Image(systemName: "gear")
                            .resizable().frame(width: 40, height: 40)
                                .padding([.leading, .top])
                        }.sheet(isPresented: self.$settingsInView) {
                            SheetView(settingsInView: self.$settingsInView, soundToChange: self.$selectedSound)
                        }
                        Spacer()
                    }
                    Spacer()
                }
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
                                self.timerManager.fireTimer(withSound: self.selectedSound)
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
                            playSound(sound: self.selectedSound)
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
            //HistoryTabView()
            BarChartView()
            .tabItem {
                Image(systemName: "clock")
                Text("History")
            }
        }
        .accentColor(Color("paletteOrange"))
        .onAppear() {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1))
        }
    }
}

struct SheetView: View {
        
    @Binding var settingsInView: Bool
    @State var isInSoundsList: Bool = false
    @Binding var soundToChange: String
    
    let sounds: [TimerSound] = [
        TimerSound(easyName: "Short Gong", fileName: "LowBowlPadBeatMidVel4"),
        TimerSound(easyName: "Singing Bowl", fileName: "crystalWandOnSingingBowl"),
        TimerSound(easyName: "Prayer Bowl Tap", fileName: "Prayer Bowls3_Shriek_2011"),
        TimerSound(easyName: "Prayer Bowl Sustained", fileName: "Prayer Bowls4_Shriek_2011")
    ]
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Button(action: { self.settingsInView = false }, label: { Text("Done").bold().foregroundColor(Color(#colorLiteral(red: 0.9546920657, green: 0.5094110966, blue: 0.3724370599, alpha: 1))).padding([.top, .leading])})
                        Spacer()
                        Text("Settings").font(.system(size: 25)).fontWeight(.bold).foregroundColor(Color(#colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1))).padding(.top)
                        Spacer()
                        Button(action: { self.settingsInView = false }, label: { Text("Cancel").bold().foregroundColor(Color(#colorLiteral(red: 0.9546920657, green: 0.5094110966, blue: 0.3724370599, alpha: 1))).padding([.top, .trailing]) })
                    }
                    Divider().background(Color(#colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1))).padding(.bottom)
                    EmptyView().padding()
                    // TODO: Add form with picker inside.
                    Form {
                        GeometryReader { geometry in
                            Picker(selection: self.$soundToChange, label: PickerLabel(width: geometry.size.width, height: geometry.size.height)) {
                                ForEach(self.sounds, id: \.fileName) { sound in
                                    Text(sound.easyName)
                                }
                            }
                        }
                    }
                    .onAppear {
                        UITableView.appearance().backgroundColor = #colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)
                        
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("").navigationBarHidden(true)
        }
        .onDisappear {
            UserDefaults.standard.set(self.soundToChange, forKey: "finishedSound")
        }
    }
}

struct PickerLabel: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Text("Sounds")
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
            .font(.system(size: 20))
            .fontWeight(.bold)
            .padding(20)
            .foregroundColor(Color(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)))
            .background(Color(#colorLiteral(red: 0.9325308204, green: 0.423905015, blue: 0.3029931784, alpha: 1)))
            .cornerRadius(10)
    }
}

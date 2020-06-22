//
//  TimerManager.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-17.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timeRemaining: Int = 0
    
    @Published var totalMeditationTime: Int = 0
    
    var timer = Timer()
    
    func fireTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.totalMeditationTime += 1
            } else {
                playSound(sound: "future-gongsound1", type: "wav")
                self.reset()
            }
        }
    }
    
    func setMeditationTime(from startingCount: Int) {
        timeRemaining = startingCount
    }
    
    func pause() {
        timer.invalidate()
    }
    
    
    func reset() {
        timer.invalidate()
        timeRemaining = 0
    }
}


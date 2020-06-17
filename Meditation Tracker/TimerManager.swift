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
    
    var timer = Timer()
    
    func start(from startingCount: Int) {
        timeRemaining = startingCount
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.reset()
            }
        }
        
    }
    
    func pause() {
        timer.invalidate()
    }
    
    func reset() {
        timer.invalidate()
        timeRemaining = 0
    }
}


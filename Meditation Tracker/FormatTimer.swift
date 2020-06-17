//
//  FormatTimer.swift
//  Simple Timer
//
//  Created by Garrick Henne on 2020-06-17.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import Foundation

func convertSecondsToMinutesAndSeconds(seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuteStamp):\(secondStamp)"
}

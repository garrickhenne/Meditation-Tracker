//
//  HistoryTabView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-23.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct HistoryTabView: View {
    @EnvironmentObject var timeRemaining: TimerManager
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Total Time Meditated: \(self.timeRemaining.totalMeditationTime)")
                .foregroundColor(Color("paletteCream"))
                
                //BarChartView()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color("paletteBlack"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HistoryTabView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTabView().environmentObject(TimerManager())
    }
}

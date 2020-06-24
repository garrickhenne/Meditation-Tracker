//
//  BarChartView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-23.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150],
        [20, 30, 180],
        [50, 30, 70]
    ]
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Mindful History")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(#colorLiteral(red: 0.9546920657, green: 0.5094110966, blue: 0.3724370599, alpha: 1)))
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                
                HStack (spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                }
                    .padding(.top, 24)
                    .animation(.default)
            }
            
        }
    }
}

struct BarView: View {
    
    var value: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(#colorLiteral(red: 0.9546920657, green: 0.5094110966, blue: 0.3724370599, alpha: 1)))
            }
            Text("D").padding(.top, 8)
                .foregroundColor(Color(#colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1)))
        }
    }
}






struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}

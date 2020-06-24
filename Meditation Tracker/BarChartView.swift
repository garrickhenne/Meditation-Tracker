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
    
    init() {
        let pickerControl = UISegmentedControl.appearance()
        pickerControl.selectedSegmentTintColor = #colorLiteral(red: 0.9546920657, green: 0.5094110966, blue: 0.3724370599, alpha: 1)
        pickerControl.setTitleTextAttributes([.foregroundColor: #colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1)], for: .selected)
        pickerControl.setTitleTextAttributes([.foregroundColor: #colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1)], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                LeftTrailingTextView(with: "Time Spent: ")
                LeftTrailingTextView(with: "Average Time: ")
                Picker(selection: self.$pickerSelectedItem, label: Text("")) {
                    Text("Weekly").tag(0)
                    Text("Monthly").tag(1)
                    Text("Yearly").tag(2)
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack (spacing: 16) {
                    BarView(value: self.dataPoints[self.pickerSelectedItem][0])
                    BarView(value: self.dataPoints[self.pickerSelectedItem][1])
                    BarView(value: self.dataPoints[self.pickerSelectedItem][2])
                }
                    .padding()
                    .animation(.default)
                Spacer()
            }
            .padding(.top, 100)
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

struct LeftTrailingTextView: View {
    
    var with: String
    
    var body: some View {
        HStack {
            Text(with)
                .font(Font.system(size: 20))
                .foregroundColor(Color(#colorLiteral(red: 0.8784313725, green: 0.9843137255, blue: 0.9882352941, alpha: 1)))
                .fontWeight(.heavy)
                .padding()
            Spacer()
        }
    }
}

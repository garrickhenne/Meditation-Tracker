//
//  HistoryView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-18.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        TabView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .tabItem {
                Image(systemName: "clock")
                Text("History")
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

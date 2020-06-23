//
//  SettingsView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-22.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Hello World")
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color("paletteBlack"))
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    
    
    
    
    
    
    // MARK: - Constants
    let backgroundPalette = UIColor(red: 41 / 255, green: 50 / 255, blue: 65 / 255, alpha: 1.0)
    
    let textColor = UIColor(red: 238 / 255, green: 108 / 255, blue: 77 / 255, alpha: 1.0)
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

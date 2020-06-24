//
//  SettingsView.swift
//  Meditation Tracker
//
//  Created by Garrick Henne on 2020-06-22.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    

    init() {
        UITableView.appearance().backgroundColor = #colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)
        UITableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.1593825817, green: 0.1971980333, blue: 0.253005743, alpha: 1)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    @State var vibrateOnly: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ToggleRow(vibrateOnly: $vibrateOnly)
                NavigationLink(destination: SoundsList(), label: {
                    HStack {
                        Text("Sounds")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color("paletteCream"))
                        Spacer()
                        Image(systemName: "chevron.right")
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    }
                    
                })
            }
        }
    }
    
    struct ToggleRow: View {
        
        @Binding var vibrateOnly: Bool
        
        var body: some View {
            Toggle(isOn: self.$vibrateOnly, label: {
                Text("Vibrate Only")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color("paletteCream"))
                
            })
        }
    }
    
    struct SoundsList: View {
        
        var body: some View {
            List {
                Text("hello")
            }
        }
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

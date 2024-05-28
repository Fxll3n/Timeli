//
//  SettingsView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/24/24.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @AppStorage("enableNote") private var enableNotes = true
    @AppStorage("enableReminder") private var enableReminders = true
    @AppStorage("enableToDo") private var enableToDo = true
    
    @State private var selectedColor: Color = Color.black
    @State private var colorData = ColorData()
    var body: some View {
        Text("Settings")
            .font(.custom("Rosmatika", size: 50))
            .bold()
            .tint(selectedColor)
            .onAppear(){
                selectedColor = colorData.loadColor()
            }
        Spacer()
        
        //Features Section
        
        Group{
            Text("Enabled Features:")
                .font(.custom("Rosmatika", size: 20))
                .bold()
                .underline()
                
            VStack{
                Toggle("Notes", isOn: $enableNotes)
                    .tint(selectedColor)
                Toggle("Reminders", isOn: $enableReminders)
                    .tint(selectedColor)
                Toggle("To-Do List", isOn: $enableToDo)
                    .tint(selectedColor)
            }.padding(10)
        }
        
        // Color Section
        
        Group{
            Text("Color theme:")
                .font(.custom("Rosmatika", size: 20))
                .bold()
                .underline()
            Group{
                ColorPicker("Main:", selection: $selectedColor)
                    .onChange(of: selectedColor){
                        colorData.saveColor(color: selectedColor)
                        print("AutoSaved")
                    }
            }.padding(10)
        }
        
        
        Spacer()
    }
}

#Preview {
    SettingsView()
}


class ColorData {
    private var COLOR_KEY = "COLOR_KEY"
    private let userDefaults = UserDefaults.standard
    
    func saveColor(color: Color) {
        // Convert the color into RGB
        let color = UIColor(color).cgColor
        
        // Save the RGB into an array
        if let components = color.components {
            userDefaults.set(components, forKey: COLOR_KEY)
            
            print("Colour saved!")
        }
    }
    
    func loadColor() -> Color{
        // Get the RGB array
        guard let array = userDefaults.object(forKey: COLOR_KEY) as? [CGFloat] else { return Color.black }
        
        // Create a color from the RGB array
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3])
        
        print("Colour loaded!")
        return color
    }
}

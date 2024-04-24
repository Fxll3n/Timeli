//
//  SetupTimeli.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/17/24.
//

import SwiftUI

struct SetupTimeliStart: View {
    var body: some View {
        NavigationStack{
            HStack{
                Text("Timeli")
                    .font(.system(size: 80))
            }
            Spacer()
            NavigationLink{
                SetUpFeatures().navigationBarBackButtonHidden(true)
            } label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 100, alignment: .center)
                    .foregroundColor(.black)
                    .overlay(
                        Text("Set Up")
                            .font(.system(size: 80))
                            .foregroundStyle(.white)
                    )
            }
            Spacer()
        }
    }
}

#Preview {
    SetupTimeliStart()
}


struct SetUpFeatures: View {
    @State private var enableNotes = true
    @State private var enableReminders = true
    @State private var enableToDo = true
    var body: some View {
        VStack{
            HStack{
                Text("Features")
                    .font(.system(size: 80))
            }
            Spacer()
            VStack{
                Toggle("Notes", isOn: $enableNotes)
                    .tint(.black)
                Toggle("Reminders", isOn: $enableReminders)
                    .tint(.black)
                Toggle("To-Do List", isOn: $enableToDo)
                    .tint(.black)
            }.padding(10)
            
            Spacer()
            HStack{
                NavigationLink{
                    ContentView().navigationBarBackButtonHidden(true) // Hide the "Back" button
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 135, height: 65, alignment: .center)
                        .foregroundColor(.black)
                        .overlay(
                            Text("Next")
                                .font(.system(size: 60))
                                .foregroundStyle(.white)
                        )
                }
            }
        }.onDisappear(){
            UserDefaults.standard.set(enableNotes, forKey: "enableNotes")
            UserDefaults.standard.set(enableReminders, forKey: "enableReminder")
            UserDefaults.standard.set(enableToDo, forKey: "enableToDo")
            // Debug (Checks whether preferences are saved properly)
            print("Notes: \(UserDefaults.standard.bool(forKey: "enableNotes"))\nReminders: \(UserDefaults.standard.bool(forKey: "enableReminder"))\nToDo: \(UserDefaults.standard.bool(forKey: "enableToDo"))")
        }
    }
}

#Preview {
    SetUpFeatures()
}

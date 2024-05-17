//
//  SettingsView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/24/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("enableNote") private var enableNotes = true
    @AppStorage("enableReminder") private var enableReminders = true
    @AppStorage("enableToDo") private var enableToDo = true
    var body: some View {
        Text("Settings")
            .bold()
            .underline()
            .font(.title)
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
    }
}

#Preview {
    SettingsView()
}

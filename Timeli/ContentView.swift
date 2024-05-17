//
//  ContentView.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/17/24.
//

import SwiftUI
import UserNotifications
import SwiftData

struct ContentView: View {
    @AppStorage("currentView") private var currentView = 0
    var body: some View{
        ZStack{
            
            if currentView == 0 && UserDefaults.standard.bool(forKey: "enableNotes") == true{
                NotesView()
            }else if currentView == 1 && UserDefaults.standard.bool(forKey: "enableReminder") == true{
                RemindersView()
            }else if currentView == 2 && UserDefaults.standard.bool(forKey: "enableToDo") == true{
                ToDoListView()
            }else if currentView == 3{
                SettingsView()
                    
            }

            VStack{ 
                HStack{
                    TabViewer()
                        .padding()
                    Spacer()
                    
                    
                }
                Spacer()
                Spacer()
            }
            
        }
        .onAppear(){
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Notification authorization granted")
                } else {
                    print("Notification authorization denied")
                }
            }
            currentView = 0
        }
    }
    
}

#Preview {
    ContentView()
}

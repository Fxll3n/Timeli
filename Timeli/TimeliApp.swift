//
//  TimeliApp.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/17/24.
//

import SwiftUI
import SwiftData
import TipKit
import AnimatedTabBar

@main
struct TimeliApp: App {
    @AppStorage("currentView") var currentView = 0
    @State var isSetUp = UserDefaults.standard.bool(forKey: "isSetUp")
    var body: some Scene {
        
        WindowGroup {
            NavigationStack{
                if isSetUp == true{
                    switch currentView{
                    case 0:
                        NotesView()
                    case 1:
                        RemindersView()
                    case 2:
                        ToDoListView()
                    case 3:
                        SettingsView()
                    default:
                        NotesView()
                    }
                        
                    
                    AnimatedTabBar(selectedIndex:$currentView){
                        TabBarButton(name: "Notes", icon: "text.cursor")
                        TabBarButton(name: "Reminders", icon: "clock.circle")
                        TabBarButton(name: "To-Do", icon: "list.bullet.clipboard")
                        TabBarButton(name: "Settings", icon: "gearshape")
                    }
                    .ballTrajectory(.straight)
                    .ballAnimation(.easeInOut)
                    .ballColor(.black)
                    .cornerRadius(25.5)
                    .barColor(.black)
                    .unselectedColor(.gray)
                    .selectedColor(.white)
                    
                }else{
                    SetupTimeliStart()
                        .onAppear(){
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                                if granted {
                                    print("Notification authorization granted")
                                } else {
                                    print("Notification authorization denied")
                                }
                            }
                            
                        }
                }
            }
            .task{
                try? Tips.configure()
            }
        }
        
        
        .modelContainer(for: [ToDoModel.self, RemindModel.self])
        
    }
}

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
    
    @State var currentColor = Color.black
    let selectionColor = Color(white: 1, opacity: 1)
    let unselectedColor = Color(white: 1, opacity: 0.5)
    @State var colorData = ColorData()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationStack{
                
                if isSetUp == true{
                    switch currentView{
                    case 0:
                        NotesView()
                            .onAppear(){
                                currentColor = colorData.loadColor()
                            }
                    case 1:
                        RemindersView()
                            .onAppear(){
                                currentColor = colorData.loadColor()
                            }
                    case 2:
                        ToDoListView()
                            .onAppear(){
                                currentColor = colorData.loadColor()
                            }
                    case 3:
                        SettingsView()
                            .onAppear(){
                                currentColor = colorData.loadColor()
                            }
                    default:
                        NotesView()
                            .onAppear(){
                                currentColor = colorData.loadColor()
                            }
                    }
                        
                    Spacer()
                    Group{
                        AnimatedTabBar(selectedIndex:$currentView){
                            TabBarButton(name: "Notes", icon: "text.cursor")
                            TabBarButton(name: "Reminders", icon: "clock.circle")
                            TabBarButton(name: "To-Do", icon: "list.bullet.clipboard")
                            TabBarButton(name: "Settings", icon: "gearshape")
                        }
                        .ballTrajectory(.straight)
                        .ballColor(currentColor)
                        .cornerRadius(15)
                        .barColor(currentColor)
                        .unselectedColor(unselectedColor)
                        .selectedColor(selectionColor)
                        
                    }
                    .frame(height: 85)
                    .padding()
                    
                    
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
            .onAppear(){
                colorData.loadColor()
            }
            .task{
                try? Tips.configure()
            }
        }
        
        
        .modelContainer(for: [ToDoModel.self, RemindModel.self])
        
    }
}

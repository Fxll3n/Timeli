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
    
    @State var enabledViews: [MyView] = [
        MyView(id: 1, view: AnyView(NotesView())),
        MyView(id: 2, view: AnyView(RemindersView())),
        MyView(id: 3, view: AnyView(ToDoListView())),
        MyView(id: 1, view: AnyView(SettingsView()))
        
    ]
    var body: some View{
        NavigationStack{
            VStack{
                HStack{
                    TabViewer(views: enabledViews)
                    Spacer()
                }
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
            
        }
    }
    
}

#Preview {
    ContentView()
}

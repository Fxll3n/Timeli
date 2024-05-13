//
//  ContentView.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/17/24.
//mfnfnz,xnf,vmmz,mnc,zczmncnv,,mnv,mn,zmvncmcnv,x,cmvxmvn,xmcmnkdjdfsdjsfqqweqwrkjfdslf;;d;;z;z;zsadflasdfaslfasdfFDfasldfllkjsflskjfslkdjfslkdjflskdjfslkdjfdklsjflsd;fs;kflsjf;sklfjldkfj;llllll

import SwiftUI
import UserNotifications
import SwiftData

struct ContentView: View {
    @AppStorage("currentView") private var currentView = 0
    var body: some View{
        ZStack{
            
            if currentView == 0{
                NotesView()
            }else if currentView == 1{
                RemindersView()
            }else if currentView == 2{
                ToDoListView()
            }else if currentView == 3{
                SettingsView()
                    
            }

            VStack{ 
                HStack{
                    TabViewer()
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

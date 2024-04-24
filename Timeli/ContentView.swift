//
//  ContentView.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/17/24.
//

import SwiftUI

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
            currentView = 0
        }
    }
}

#Preview {
    ContentView()
}

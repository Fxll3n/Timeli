//
//  TimeliApp.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/17/24.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct TimeliApp: App {
    @State var isSetUp = UserDefaults.standard.bool(forKey: "isSetUp")
    var body: some Scene {
        
        WindowGroup {
            NavigationStack{
                if isSetUp == true{
                    ContentView()
                }else{
                    SetupTimeliStart()
                }
            }
        }
        
        .modelContainer(for: [ToDoModel.self, RemindModel.self])
        
    }
}

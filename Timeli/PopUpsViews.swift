//
//  PopUpsViews.swift
//  Timeli
//
//  Created by Angel Bitsov on 5/24/24.
//

import SwiftUI
import UserNotifications

struct WelcomePopup: View {
    @State var color: Color
    @AppStorage("isSettingUp") var isSettingUp = true
    @AppStorage("isSetUp") var isSetUp = false
    var body: some View {
        VStack{
            Circle()
                .frame(width: 60, height: 60, alignment: .center)
                .foregroundStyle(color)
                .padding()
                .overlay(
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundStyle(.white)
                        
                )
            Text("Welcome to Timeli")
                .font(.title)
                
            Text("One of Timeli's main features requires notifications to be enabled for it to work as intended.\nWould you like to enable notifications?")
                .padding()
                .frame(alignment: .leading)
            Button(){
                isSettingUp = false
                isSetUp = true
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if granted {
                        
                        print("Notification authorization granted")
                    } else {
                        print("Notification authorization denied")
                    }
                }
            } label: {
                RoundedRectangle(cornerRadius: 10.0)
                    .overlay(
                        Text("Enable Notifications")
                            .bold()
                            .foregroundStyle(.white)
                    )
                
            }
            .frame(width: 200, height: 40, alignment: .center)
            .padding()
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}


struct SuccessfullyCreatedNewItem: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                Text("You have sucessfully created a new item!")
                    .font(.title3)
            }
            .padding()
            .foregroundStyle(.white)
                
                
        }
        .background(.green)
        
        
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

#Preview {
    SuccessfullyCreatedNewItem()
}

struct SuccessfullyCreatedNewToDo: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                Text("You have sucessfully created a new ToDo!")
                    .font(.title3)
            }
            .padding()
            .foregroundStyle(.white)
                
                
        }
        .background(.green)
        
        
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

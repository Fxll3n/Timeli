//
//  NewReminderView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/29/24.
//

import SwiftUI
import SwiftData
import UserNotifications
import TipKit


struct NewReminderView: View {
    var setTitleAndDescriptionRemind = setNameAndTitleReminder()
    var specifyDate = specifyATimeReminder()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var inputTitle = ""
    @State private var inputDescrip = ""
    @State private var inputDueDate = Date()
    @State private var timeBeforeNotif = 10
    @State private var showAlert = false
    @State private var alertReason = ""
    @State private var text1Changed = false
    @State private var text2Changed = false
    
    @State private var selectedColor: Color = Color.black
    @State private var colorData = ColorData()
    
    var body: some View {
        VStack{
            Group {
                TextField("Reminder Title", text: $inputTitle)
                    .onChange(of: inputTitle){
                        text1Changed = true
                    }
                TextField("Reminder Description", text: $inputDescrip)
                    .onChange(of: inputDescrip){
                        text2Changed = true
                        if text1Changed && text2Changed{
                            setTitleAndDescriptionRemind.invalidate(reason: .actionPerformed)
                        }
                    }
            }.textFieldStyle(.roundedBorder)
             .multilineTextAlignment(.leading)
             .popoverTip(setTitleAndDescriptionRemind)
             
            DatePicker("Due Date:", selection: $inputDueDate)
            if text1Changed && text2Changed{
                TipView(specifyDate)
            }
            Button("Submit"){
                if inputTitle != "" && inputDescrip != ""{
                    addItem(title: inputTitle, descrip: inputDescrip, due: inputDueDate)
                    dismiss()
                    scheduleNotification(title: inputTitle, context: "Due now!", date: inputDueDate)
                }else if inputTitle == "" && inputDescrip != ""{
                    showAlert = true
                    alertReason = "Please enter a title."
                }else if inputTitle != "" && inputDescrip == ""{
                    showAlert = true
                    alertReason = "Please enter a description."
                }else{
                    showAlert = true
                    alertReason = "Please enter both a title and description."
                }
                
            }
            .foregroundStyle(selectedColor)
            .alert("\(alertReason)", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .onAppear(){
            selectedColor = colorData.loadColor()
        }
        .task{
            // Configure and load your tips at app launch.
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
        .padding()
        
    }
    
    
    func addItem(title: String, descrip: String, due: Date){
        let item = RemindModel(title: title, descrip: descrip, dueDate: due, dateMade: Date.now)
        
        context.insert(item)
    }
    
    func scheduleNotification(title: String, context: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = context
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}



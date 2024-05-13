//
//  RemindersView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/24/24.
//

import SwiftUI
import SwiftData

struct RemindersView: View {

    
    @Environment(\.modelContext) private var context
    @Query private var items: [RemindModel]
    
    @State private var isMakingNew = false
    
    var body: some View {
        VStack{
            Text("Reminders")
                .bold()
                .underline()
                .font(.title)
            Button("+"){
                isMakingNew.toggle()
            }
            .popover(isPresented: $isMakingNew){
                NewReminderView()
            }
            
            List{
                ForEach(items) { item in
                    ReminderItemView(title: item.title, descrip: item.descrip, dueDate: item.dueDate, dateMade: item.dateMade)
                }
                .onDelete{ indexes in
                    for index in indexes{
                        deleteItem(items[index])
                    }
                }
            }
        }
    }
    
    func deleteItem(_ item: RemindModel){
        context.delete(item)
    }
    
    
    
}



/*
@State private var date = Date()
@State private var title = ""
@State private var content = ""



VStack{
        Text("Reminders View")
        DatePicker("Choose ", selection: $date)
        TextField("Enter Title", text: $title)
        TextField("Enter Content", text: $content)
        Button("Schedule Notification") {
            scheduleNotification(title: title, context: content, date: date)
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
 */

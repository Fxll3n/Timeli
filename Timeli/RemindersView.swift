//
//  RemindersView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/24/24.
//

import SwiftUI
import SwiftData
import TipKit

struct RemindersView: View {
    
    var makeReminderTip = makeNewReminderItem()
    
    @Environment(\.modelContext) private var context
    @Query private var items: [RemindModel]
    
    @State private var isMakingNew = false
    
    @State private var selectedColor: Color = Color.black
    @State private var colorData = ColorData()
    
    var body: some View {
        VStack{
            Text("Reminders")
                .bold()
                .font(.title)
        }
        .onAppear(){
            selectedColor = colorData.loadColor()
        }
        
        
        .sheet(isPresented: $isMakingNew){
            NewReminderView()
        }
        
        List{
            ForEach(items) { item in
                NavigationLink{
                    ReminderViewExpandedView(title: item.title, descrip: item.descrip, dueDate: item.dueDate, dateMade: item.dateMade)
                }label:{
                    ReminderItemView(title: item.title, descrip: item.descrip, dueDate: item.dueDate, dateMade: item.dateMade)
                }
            }
            .onDelete{ indexes in
                for index in indexes{
                    deleteItem(items[index])
                }
            }
        }.ignoresSafeArea()
        
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: 0) {
                HStack(){
                    TipView(makeReminderTip, arrowEdge: .trailing)
                        .shadow(radius: 10)
                    Button{
                        isMakingNew.toggle()
                        makeReminderTip.invalidate(reason: .actionPerformed)
                    }label:{
                        ZStack{
                            Circle()
                                .foregroundStyle(selectedColor)
                                .frame(width: 70, height: 70)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.white)
                                .frame(width: 100, height: 100)
                                .sheet(isPresented: $isMakingNew){
                                    NewToDoItemView()
                                    
                                }
                            
                            
                            
                        }
                    }
                }.padding()
                
            }
            
    }
    
    func deleteItem(_ item: RemindModel){
        context.delete(item)
    }
    
    
    
}

#Preview {
    RemindersView()
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


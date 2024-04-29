//
//  ReminderItemView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/29/24.
//

import SwiftUI

struct ReminderItemView: View {
    @State var title: String
    @State var descrip: String
    @State var dueDate: Date
    @State var dateMade: Date
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.largeTitle)
                Text(descrip)
            }
            Spacer()
            
            VStack(alignment: .leading){
                Text("Due: \(formatDate(dueDate))")
                    
                Text("Made on: \(formatDate(dateMade))")
            }.bold()
        }
    }
    
    func formatDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
    
}

#Preview {
    ReminderItemView(title: "Homework", descrip: "Please do it ;)", dueDate: Date.now, dateMade: Date.now)
}

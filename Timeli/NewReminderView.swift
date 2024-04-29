//
//  NewReminderView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/29/24.
//

import SwiftUI
import SwiftData

struct NewReminderView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var inputTitle = ""
    @State private var inputDescrip = ""
    @State private var inputDueDate = Date()
    var body: some View {
        TextField("Enter Title", text: $inputTitle)
        TextField("Enter Title", text: $inputDescrip)
        DatePicker("Chooose Due Date:", selection: $inputDueDate)
        Button("Submit"){
            addItem(title: inputTitle, descrip: inputDescrip, due: inputDueDate)
            dismiss()
        }
    }
    
    func addItem(title: String, descrip: String, due: Date){
        let item = RemindModel(title: title, descrip: descrip, dueDate: due, dateMade: Date.now)
        
        context.insert(item)
    }
}

#Preview {
    NewReminderView()
}

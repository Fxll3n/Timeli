//
//  NewToDoItemView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/25/24.
//

import SwiftUI
import SwiftData

struct NewToDoItemView: View {
    
    @AppStorage("didCreateNewToDo") var didCreateNewToDo = true
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var inputTitle = ""
    @State private var inputDescrip = ""
    @State private var showAlert = false
    @State private var alertReason = ""
     
    var body: some View {
        VStack {
            Group {
                TextField("Enter Title", text: $inputTitle)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter Description", text: $inputDescrip)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            Button("Submit") {
                if inputTitle.isEmpty && inputDescrip.isEmpty {
                    showAlert = true
                    alertReason = "Please enter both a title and description."
                } else if inputTitle.isEmpty {
                    showAlert = true
                    alertReason = "Please enter a title."
                } else if inputDescrip.isEmpty {
                    showAlert = true
                    alertReason = "Please enter a description."
                } else {
                    didCreateNewToDo = true
                    addItem(title: inputTitle, text: inputDescrip)
                    dismiss()
                }
                
            }
            .alert(alertReason, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
    }
    
    func addItem(title: String, text: String) {
        let newItem = ToDoModel(title: title, text: text, isChecked: false)
        context.insert(newItem)
    }
    
    
}

#Preview {
    NewToDoItemView()
}

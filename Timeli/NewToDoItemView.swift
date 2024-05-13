//
//  NewToDoItemView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/25/24.
//

import SwiftUI

struct NewToDoItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.modelContext) private var context
    
    @State private var inputTitle = ""
    @State private var inputDescrip = ""
    @State private var showAlert = false
    @State private var alertReason = ""
    
    var body: some View {
        VStack{
            Group{
                TextField("Enter Title", text: $inputTitle)
                TextField("Enter Description", text: $inputDescrip)
            }
            .textFieldStyle(.roundedBorder)
            
            Button("Submit"){
                if inputTitle != "" && inputDescrip != ""{
                    addItem(title: inputTitle, text: inputDescrip)
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
            .alert("\(alertReason)", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
    }
    
    func addItem(title: String, text: String){
        let item = ToDoModel(title: title, text: text)
        
        context.insert(item)
    }
}

#Preview {
    NewToDoItemView()
}

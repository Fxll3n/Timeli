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
    
    @State private var titleInput = ""
    @State private var textInput = ""
    
    var body: some View {
        TextField("Enter Title", text: $titleInput)
        TextField("Enter Text", text: $textInput)
        Button("Submit"){
            addItem(title: titleInput, text: textInput)
            dismiss()
        }
    }
    
    func addItem(title: String, text: String){
        let item = ToDoModel(title: title, text: text)
        
        context.insert(item)
    }
}

#Preview {
    NewToDoItemView()
}

//
//  NotesView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/19/24.
//

import SwiftUI
import Markdown

struct NotesView: View {
    @Environment(\.modelContext) private var context
    
    @State var isEditing = false
    
    @State private var text = "abcdefghijklmnopqrstuvwxyz\n**abcdefghijklmnopqrstuvwxyz**\n*abcdefghijklmnopqrstuvwxyz*\n~abcdefghijklmnopqrstuvwxyz~\n# abcdefghijklmnopqrstuvwxyz"
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    isEditing.toggle()
                }, label: {
                    Text(isEditing ? "Done" : "Edit")
                })
                .padding(10)
            }
            
            if isEditing{
                TextEditor(text: $text)
            }else{
                Markdown(content: $text)
            }
        }
    }
    
    
    
}



#Preview {
    NotesView()
}

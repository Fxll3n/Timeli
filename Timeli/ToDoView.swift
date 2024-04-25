//
//  MDFile.swift
//  Timeli
//
//  Created by Schneider Lambert on 4/23/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var items: [ToDoModel]
    
    @State private var isMakingNewItem = false
    
    var body: some View {
        VStack {
            Text("To Do List")
                .bold()
                .underline()
                .font(.title)
            Button("+"){
                isMakingNewItem.toggle()
            }
            .sheet(isPresented: $isMakingNewItem){
                NewToDoItemView()
            }
            List{
                ForEach(items) { item in
                    ToDoItemView(title: item.title, text: item.text)
                }
            }
            
        }
    }
}

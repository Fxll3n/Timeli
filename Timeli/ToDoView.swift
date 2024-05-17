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
            Button{
                isMakingNewItem.toggle()
            }label:{
                Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
            }
            .frame(width: 100, height: 100)
            .sheet(isPresented: $isMakingNewItem){
                NewToDoItemView()
            }
            List{
                ForEach(items) { item in
                    ToDoItemView(title: item.title, text: item.text)
                }
                .onDelete{ indexes in
                    for index in indexes{
                        deleteItem(items[index])
                    }
                }
            }
            
        }
    }
    
    func deleteItem(_ item: ToDoModel){
        context.delete(item)
    }
}

#Preview() {
    ToDoListView()
}

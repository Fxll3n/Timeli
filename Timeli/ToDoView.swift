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
                .font(.title)
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
            }.ignoresSafeArea()
            
                .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: 10) {
                    Button{
                        isMakingNewItem.toggle()
                    }label:{
                        ZStack{
                            Circle()
                                .padding(.trailing)
                                .foregroundStyle(Color.black)
                                .frame(width: 70, height: 70)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.white)
                                .padding(.trailing)
                                .frame(width: 100, height: 100)
                                .sheet(isPresented: $isMakingNewItem){
                                    NewToDoItemView()
                            
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

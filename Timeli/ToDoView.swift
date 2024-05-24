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
    
    @State private var selectedColor: Color = .black
    @State private var colorData = ColorData()
    
    var body: some View {
        VStack {
            Text("To Do List")
                .bold()
                .font(.title)
                .padding(.top)
            
            List {
                ForEach(items) { item in
                    ToDoItemView(execute: {save(item)}, title: item.title, text: item.text, isChecked: item.isChecked)
                }


                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear {
                selectedColor = colorData.loadColor()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    isMakingNewItem.toggle()
                }) {
                    ZStack {
                        Circle()
                            .foregroundStyle(selectedColor)
                            .frame(width: 70, height: 70)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.white)
                    }
                }
                .padding()
                .sheet(isPresented: $isMakingNewItem) {
                    NewToDoItemView()
                }
            }
        }
    }
    
    func deleteItem(_ item: ToDoModel) {
        context.delete(item)
    }
    
    func save(_ item: ToDoModel) {
        do {
            try context.save()
            print("Item saved successfully.")
        } catch {
            print("Error saving item: \(error)")
        }
    }

}

#Preview {
    ToDoListView()
}

//
//  MDFile.swift
//  Timeli
//
//  Created by Schneider Lambert on 4/23/24.
//

import SwiftUI
import SwiftData
import TipKit
import PopupView

struct ToDoListView: View {
    
    @State var makeNewToDoItemTip = makeNewToDoItem()
    
    @AppStorage("didCreateNewToDo") var didCreateNewToDo = false
    
    @Environment(\.modelContext) private var context
    @Query private var items: [ToDoModel]
    
    @State private var isMakingNewItem = false
    
    @State private var selectedColor: Color = .black
    @State private var colorData = ColorData()
    
    var body: some View { 
        VStack {
            Text("To Do List")
                .font(.custom("Rosmatika", size: 50))
                .bold()
                .font(.title)
                .onChange(of: didCreateNewToDo){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
                        didCreateNewToDo = false
                    }
                }
            
                .popup(isPresented: $didCreateNewToDo) {
                    SuccessfullyCreatedNewToDo()
                } customize: {
                    $0.isOpaque(true)
                        .autohideIn(2)
                        .type(.floater())
                        .position(.top)
                        .animation(.spring())
                }
            
                .onAppear {
                    selectedColor = colorData.loadColor()
                }
            
            .sheet(isPresented: $isMakingNewItem) {
                NewToDoItemView()
            }
            
            List {
                ForEach(items) { item in
                    ToDoItemView(title: item.title, text: item.text, isChecked: item.isChecked)
                }


                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }.ignoresSafeArea()
            
            
            
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: 0){
                HStack {
                    TipView(makeNewToDoItemTip, arrowEdge: .trailing)
                        .shadow(radius: 10)
                    Button(action: {
                        isMakingNewItem.toggle()
                    }) {
                        ZStack{
                            Circle()
                                .foregroundStyle(selectedColor)
                                .frame(width: 70, height: 70)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.white)
                        }
                    }
                    
                    
                }.padding()
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

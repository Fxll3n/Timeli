//
//  MDFile.swift
//  Timeli
//
//  Created by Schneider Lambert on 4/23/24.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var List = []
    
    var body: some View {
        VStack {
            Text("To Do List")
                .bold()
                .underline()
                .font(.title)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("+")
            })
                SwiftUI.List {
                ForEach (0..<List.count, id: \.self){ToDoList in
                }
            }
        }
    }
}
#Preview {
    ToDoListView(List: [])
}

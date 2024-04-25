//
//  ToDoItemView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/25/24.
//

import SwiftUI

struct ToDoItemView: View {
    @State var title: String
    @State var text: String
    var body: some View {
        VStack{
            Text("\(title)")
                .font(.title)
            Text("\(text)")
                .font(.title2)
        }
    }
}

#Preview {
    ToDoItemView(title: "1234Test", text: "Test1234")
}

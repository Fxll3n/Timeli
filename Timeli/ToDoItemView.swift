//
//  ToDoItemView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/25/24.
//

import SwiftUI
import SwiftData

struct ToDoItemView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var items: [ToDoModel]
    
    
    
    @State var title: String
    @State var text: String
    @State var isChecked: Bool
    var body: some View {
        if isChecked{
            
            Group{
                HStack(spacing: 20){
                    Image(systemName: "checkmark.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.gray)
                        .onTapGesture {
                            isChecked.toggle()
                        }
                    VStack(alignment: .leading){
                        Text("\(title)")
                            .font(.title)
                            .foregroundStyle(.gray)
                        Text("\(text)")
                            .font(.title2)
                            .foregroundStyle(.gray)
                    }
                }
            }
            
                
             
            
        }else{
            HStack(spacing: 20){
                Image(systemName: "square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        isChecked.toggle()                    }
                VStack(alignment: .leading){
                    Text("\(title)")
                        .font(.title)
                    Text("\(text)")
                        .font(.title2)
                }
            }
        }
    }
    
}



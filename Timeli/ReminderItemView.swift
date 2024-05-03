//
//  ReminderItemView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/29/24.
//

import SwiftUI

struct ReminderItemView: View {
    @State var title: String
    @State var descrip: String
    @State var dueDate: Date
    @State var dateMade: Date
    
    
    var body: some View {
        NavigationStack{
            HStack{
                VStack(alignment: .leading){
                    Text(title)
                        .font(.largeTitle)
                    Text(descrip)
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Due: \(formatDate(dueDate))")
                    
                    Text("Made on: \(formatDate(dateMade))")
                }.bold()
                NavigationLink {
                    ReminderViewExpandedView(title: title, descrip: descrip, dueDate: dueDate, dateMade: dateMade)
                } label: {
                    Image(systemName: "arrow.right")
                }

            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
}

#Preview {
    ReminderItemView(title: "Homework", descrip: "Please do it ;)", dueDate: Date.now, dateMade: Date.now)
}



struct ReminderViewExpandedView: View {
    
    @State var title: String
    @State var descrip: String
    @State var dueDate: Date
    @State var dateMade: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(title)
                .font(.title)
            HStack{
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 25)
                        .modifier(RectModifier())
                        .frame(width: 235, height: 135, alignment: .leading)
                    Group{
                        VStack(alignment: .leading){
                            Text("Description:")
                                .font(.title3)
                                .bold()
                            Text(descrip)
                        }
                    }.padding(5)
                }
                

                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 25)
                        .modifier(RectModifier())
                        .frame(width: 135, height: 135, alignment: .leading)
                    Group{
                        VStack(alignment: .leading){
                            Text("Due:")
                                .font(.title3)
                                .bold()
                            Text("\(formatDate(dueDate))")
                            Text("Made on:")
                                .font(.title3)
                                .bold()
                            Text("\(formatDate(dateMade))")

                        }.padding(5)
                    }
                }
                

            }
            
            
            
        }.padding()
        Divider()
            .frame(height: 3)
            .overlay(Color.gray)
            .padding()
            .offset(y: -30)
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 25)
                .modifier(RectModifier())
            Group{
                VStack(alignment: .leading){
                    Group{
                        Text("Due:")
                            .font(.title3)
                            .bold()
                        Text("\(formatDate(dueDate))")
                        Text("Made on:")
                            .font(.title3)
                            .bold()
                        Text("\(formatDate(dateMade))")
                    }
                    Spacer()

                }.padding(5)
            }
        }.padding(10).offset(y:-50)
        Spacer()
        
    }
    
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
}
#Preview {
    ReminderViewExpandedView(title: "1234Test4321", descrip: "1234Test4321\n1\n2\n3", dueDate: Date.now, dateMade: Date.now)
}

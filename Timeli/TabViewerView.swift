//
//  TabViewer.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/19/24.
//

import SwiftUI

struct TabViewer: View {
    @Environment(\.modelContext) private var context
    @State private var isExpanded = false
    
    @State private var isNoteSelect: Bool = true
    @State private var isReminderSelect: Bool = false
    @State private var isToDoSelect: Bool = false
    @State private var isSettingSelect: Bool = false
    
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                  withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                  }
                }) {
                    ZStack(alignment: .center) {
                        
                        RoundedRectangle(cornerRadius: 27)
                            .frame(width: 70, height: isExpanded ? 290 : 70)
                            
                            .foregroundColor(.black)
                        VStack(spacing: 28){
                            
                            if isExpanded{
                                TabViewButton(isExpanded: $isExpanded, isSelected: isNoteSelect, iconName: "doc", idNumber: 0){
                                    isReminderSelect = false
                                    isToDoSelect = false
                                    isSettingSelect = false
                                    isNoteSelect = true
                                    isExpanded = false
                                }
                                TabViewButton(isExpanded: $isExpanded, isSelected: isReminderSelect, iconName: "clock", idNumber: 1){
                                    isNoteSelect = false
                                    isToDoSelect = false
                                    isSettingSelect = false
                                    isReminderSelect = true
                                    isExpanded = false
                                }
                                TabViewButton(isExpanded: $isExpanded, isSelected: isToDoSelect, iconName: "list.bullet.clipboard", idNumber: 2){
                                    isReminderSelect = false
                                    isNoteSelect = false
                                    isSettingSelect = false
                                    isToDoSelect = true
                                    isExpanded = false
                                }
                                TabViewButton(isExpanded: $isExpanded, isSelected: isSettingSelect, iconName: "ellipsis.circle", idNumber: 3){
                                    isReminderSelect = false
                                    isToDoSelect = false
                                    isNoteSelect = false
                                    isSettingSelect = true
                                    isExpanded = false
                                }
                            }else{
                                Image(systemName: "ellipsis.circle")
                                    .resizable()
                                    .frame(width: 45, height: 45, alignment: .center)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                  
                }
                
            }
            
        }
        .padding(10)
        
    }
}

#Preview {
    TabViewer()
}

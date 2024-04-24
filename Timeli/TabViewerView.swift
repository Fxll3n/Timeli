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
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                  withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                  }
                }) {
                    ZStack(alignment: .center) {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 70, height: isExpanded ? 290 : 70)
                            
                            .foregroundColor(.gray)
                        VStack(spacing: 28){
                            TabViewButton(isExpanded: $isExpanded, isSelected: true, iconName: "doc")
                            if isExpanded{
                                TabViewButton(isExpanded: $isExpanded, iconName: "clock")
                                TabViewButton(isExpanded: $isExpanded, iconName: "list.bullet.clipboard")
                                TabViewButton(isExpanded: $isExpanded, iconName: "ellipsis.circle")
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

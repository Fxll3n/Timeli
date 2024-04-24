//
//  TabViewButton.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/19/24.
//

import SwiftUI

struct TabViewButton: View {
    @Binding var isExpanded: Bool
    @State var isSelected: Bool?
    @State var iconName: String?
    @State var idNumber: Int?
    
    let execute: () -> Void
    
    @AppStorage("currentView") private var currentView = 0
    
    var body: some View {
        
        if !(isSelected ?? false){
            Image(systemName: "\(iconName ?? "questionmark.circle")")
                .resizable()
                .frame(width: 45, height: 45, alignment: .center)
                .foregroundStyle(.white)
                .onTapGesture {
                    execute()
                    currentView = idNumber ?? 0
                }
        }else{
            Image(systemName: "\(iconName ?? "questionmark.circle").fill")
                .resizable()
                .frame(width: 45, height: 45, alignment: .center)
                .foregroundStyle(.white)
        }
            
    }
}


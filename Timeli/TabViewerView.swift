//
//  TabViewer.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/19/24.
//

import SwiftUI


struct TabViewer: View {
    @State private var isExpanded = false
    @State var views: [MyView]?
    
    
    var body: some View {
        VStack { // Vertical stack
            RoundedRectangle(cornerRadius: isExpanded ? 20 : 30)
                .frame(width: 60, height: isExpanded ? CGFloat((views ?? []).count) * 40 + 80 : 60) // Adjust height
                .animation(.easeInOut) // Smooth animation
                .overlay(
                    VStack {
                        Spacer() // Top spacer
                        if isExpanded { // If expanded
                            ForEach((views ?? []), id: \.id) { myView in // Loop through views
                                NavigationLink(destination: myView.view) {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                }
                            }
                        }
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle() // Toggle expansion state
                            }
                        }) {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .offset(y: isExpanded ? 0 : -3) // Adjust button position
                        Spacer()
                    }
                )
        }
    }
}

struct MyView: Identifiable {
    let id: Int // Identifier
    let view: AnyView // View content
}

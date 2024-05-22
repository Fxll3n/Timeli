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
                .frame(width: 60, height: isExpanded ? CGFloat((views ?? []).count) * 40 + 90 : 60) // Adjust height
                .animation(.easeInOut) // Smooth animation
                .overlay(
                    VStack {
                        Spacer() 
                        if isExpanded {
                            ForEach((views ?? []), id: \.id) { myView in // Loop through views
                                NavigationLink(destination: myView.view) {
                                    switch myView.id {
                                    case 1:
                                        Image(systemName: "square.text.square")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    case 2:
                                        Image(systemName: "clock")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    case 3:
                                        Image(systemName: "list.bullet.circle")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    case 4:
                                        Image(systemName: "gearshape")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    default:
                                        Image(systemName: "questionmark.app")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    }
                                }
                                .foregroundStyle(.white)
                            }
                        }
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle() // Toggle expansion state
                            }
                        }) {
                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                .resizable()
                                .frame(width: 35, height: 20)
                                .foregroundStyle(.white)
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

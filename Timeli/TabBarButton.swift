//
//  TabBarButton.swift
//  Timeli
//
//  Created by Angel Bitsov on 5/23/24.
//

import SwiftUI

struct TabBarButton: View {
    @State var name: String?
    @State var icon: String?
    var body: some View {
        VStack{
            Image(systemName: icon ?? "questionmark.app")
            Text(name ?? "icon")
        }
        .frame(alignment: .bottom)
    }
}

#Preview {
    TabBarButton()
}

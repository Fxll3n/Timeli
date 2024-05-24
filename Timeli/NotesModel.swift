//
//  ToDoModel.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/17/24.
//

import Foundation
import SwiftData

@Model
class ToDoModel: Identifiable {
    var id: String
    var title: String
    var text: String
    var isChecked: Bool
    
    init(title: String, text: String, isChecked: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.text = text
        self.isChecked = isChecked
    }
}

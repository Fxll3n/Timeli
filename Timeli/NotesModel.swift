//
//  NotesModel.swift
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
    
    init(title: String, text: String) {
        self.id = UUID().uuidString
        self.title = title
        self.text = text
    }
}

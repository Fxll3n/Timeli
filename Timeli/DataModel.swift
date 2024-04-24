//
//  DataModel.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/17/24.
//

import Foundation
import SwiftData

@Model
class DataModel: Identifiable {
    var id: String
    var noteTitle: String
    var noteText: String
    
    init(noteTitle: String, noteText: String) {
        self.id = UUID().uuidString
        self.noteTitle = noteTitle
        self.noteText = noteText
    }
}

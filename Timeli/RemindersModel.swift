//
//  RemindersModel.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/29/24.
//

import Foundation
import SwiftData

@Model
class RemindModel: Identifiable{
    var id: String
    var title: String
    var descrip: String
    var dueDate: Date
    var dateMade: Date
    
    init(title: String, descrip: String, dueDate: Date, dateMade: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.descrip = descrip
        self.dueDate = dueDate
        self.dateMade = dateMade
    }
}

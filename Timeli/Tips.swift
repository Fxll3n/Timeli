//
//  Tips.swift
//  Timeli
//
//  Created by Angel Bitsov on 5/23/24.
//

import TipKit

struct makeNewReminderItem: Tip{
    var title: Text {
        Text("Create it.")
    }
    
    
    var message: Text? {
        Text("Tap the \"+\" to open the creation screen.")
    }
    
    
    var image: Image? {
        Image(systemName: "plus")
    }
}

struct setNameAndTitleReminder: Tip{
    var title: Text {
        Text("Specify it.")
    }
    
    
    var message: Text? {
        Text("Tap on the textfields and specify a title and description.")
    }
    
    
    var image: Image? {
        Image(systemName: "text.cursor")
    }
}

struct specifyATimeReminder: Tip{
    var title: Text {
        Text("Time it!")
    }
    
    
    var message: Text? {
        Text("Select an appropriate date for your reminder.")
    }
    
    
    var image: Image? {
        Image(systemName: "calendar.badge.clock")
    }
}

struct makeNewToDoItem: Tip{
    var title: Text {
        Text("Create it.")
    }
    
    
    var message: Text? {
        Text("Tap the \"+\" to open the creation screen.")
    }
    
    
    var image: Image? {
        Image(systemName: "plus")
    }
}

struct setNameAndTitleToDo: Tip{
    var title: Text {
        Text("Specify it.")
    }
    
    
    var message: Text? {
        Text("Tap on the textfields and specify a title and description.")
    }
    
    
    var image: Image? {
        Image(systemName: "text.cursor")
    }
}
    

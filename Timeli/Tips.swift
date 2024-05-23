//
//  Tips.swift
//  Timeli
//
//  Created by Angel Bitsov on 5/23/24.
//

import TipKit

struct makeNewReminderItem: Tip{
    var title: Text {
        Text("Create a new reminder.")
    }
    
    
    var message: Text? {
        Text("Tap the \"+\" to open the creation screen.")
    }
    
    
    var image: Image? {
        Image(systemName: "plus")
    }
}


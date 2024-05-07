//
//  RemindersWidgetBundle.swift
//  RemindersWidget
//
//  Created by Angel Bitsov on 5/7/24.
//

import WidgetKit
import SwiftUI

@main
struct RemindersWidgetBundle: WidgetBundle {
    var body: some Widget {
        RemindersWidget()
        RemindersWidgetLiveActivity()
    }
}

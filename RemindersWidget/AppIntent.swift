//
//  AppIntent.swift
//  RemindersWidget
//
//  Created by Angel Bitsov on 5/7/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Due Soon"
    static var description = IntentDescription("Shows a list of reminders that are soon to be due.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

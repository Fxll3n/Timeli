//
//  WidgetRemindersLiveActivity.swift
//  WidgetReminders
//
//  Created by Matthew Dudzinski on 6/3/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetRemindersAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetRemindersLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetRemindersAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetRemindersAttributes {
    fileprivate static var preview: WidgetRemindersAttributes {
        WidgetRemindersAttributes(name: "World")
    }
}

extension WidgetRemindersAttributes.ContentState {
    fileprivate static var smiley: WidgetRemindersAttributes.ContentState {
        WidgetRemindersAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetRemindersAttributes.ContentState {
         WidgetRemindersAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetRemindersAttributes.preview) {
   WidgetRemindersLiveActivity()
} contentStates: {
    WidgetRemindersAttributes.ContentState.smiley
    WidgetRemindersAttributes.ContentState.starEyes
}

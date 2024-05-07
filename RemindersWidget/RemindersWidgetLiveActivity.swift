//
//  RemindersWidgetLiveActivity.swift
//  RemindersWidget
//
//  Created by Angel Bitsov on 5/7/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RemindersWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RemindersWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RemindersWidgetAttributes.self) { context in
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

extension RemindersWidgetAttributes {
    fileprivate static var preview: RemindersWidgetAttributes {
        RemindersWidgetAttributes(name: "World")
    }
}

extension RemindersWidgetAttributes.ContentState {
    fileprivate static var smiley: RemindersWidgetAttributes.ContentState {
        RemindersWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RemindersWidgetAttributes.ContentState {
         RemindersWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RemindersWidgetAttributes.preview) {
   RemindersWidgetLiveActivity()
} contentStates: {
    RemindersWidgetAttributes.ContentState.smiley
    RemindersWidgetAttributes.ContentState.starEyes
}

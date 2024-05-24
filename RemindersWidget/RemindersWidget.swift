// RemindSharedView.swift

import WidgetKit
import SwiftUI
import Timeli

struct RemindSharedView: View {
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            Text(context.title)
            Text(context.descrip)
            // Add other relevant views (due date, etc.)
        }
    }
}

// RemindWidget.swift
struct RemindWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "RemindWidget", intent: RemindWidgetIntent.self, provider: RemindProvider()) { entry in
            RemindWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Reminders")
        .description("Display your reminders")
    }
}

struct RemindWidgetEntry: TimelineEntry {
    var date: Date
    var remind: RemindModel?
}

struct RemindWidgetEntryView: View {
    var entry: RemindWidgetEntry
    
    var body: some View {
        if let remind = entry.remind {
            RemindSharedView(remind: remind)
        } else {
            Text("No reminders")
        }
    }
}

// RemindWidgetIntent.swift (if you want customization)
struct RemindWidgetIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select Reminder"
    static var description = IntentDescription("Display a specific reminder")
    
    @Parameter var remind: RemindModelEntity?
    
    init(remind: RemindModelEntity) {
        self.remind = remind
    }
}

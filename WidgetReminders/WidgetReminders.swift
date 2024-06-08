//
//  WdigetReminders.swift
//  WdigetReminders
//
//  Created by Angel Bitsov on 5/28/24.
//

import WidgetKit
import SwiftUI
import SwiftData

struct Provider: TimelineProvider {
    @MainActor func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), remindModel: getRemindModel())
    }
    
    @MainActor func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), remindModel: getRemindModel())
        completion(entry)
    }
    
    @MainActor func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: .now, remindModel: getRemindModel())], policy: .after(.now.advanced(by: 0.2)))
        completion(timeline)
    }
    
    @MainActor
    func getRemindModel() -> [RemindModel]{
        guard let modelContainer = try? ModelContainer(for: RemindModel.self) else{
            return []
        }
        let descriptor = FetchDescriptor<RemindModel>()
        let remindModel = try? modelContainer.mainContext.fetch(descriptor)
        
        return remindModel ?? []
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let remindModel: [RemindModel]
}

struct WidgetRemindersEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(spacing: 4) {
            ForEach(entry.remindModel) { item in
                
                WidgetItemView(title: item.title, dueDate: item.dueDate)
                
                    
                    
                    
            }
            
        }
        .padding(3)
        .frame(width: 160, height: 100)
        
    }
}



struct WidgetItemView: View {
    @State var title: String
    @State var dueDate: Date
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
            VStack(alignment: .leading){
                Text("\(title ?? "error")")
                    .font(.title2)
                Text("\((dueDate.formatted(date: .abbreviated, time: .shortened)) ?? "time error")")
                    
            }.padding(1)
            
            .font(.caption2)
            .foregroundStyle(.white)
        }
        .frame(height: 45)
        
    }
}

struct WidgetReminders: Widget {
    let kind: String = "WidgetReminders"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetRemindersEntryView(entry: entry)
                    .containerBackground(.background, for: .widget)
            }
        }
        
        .configurationDisplayName("Reminders Widget")
        .description("Shows existing reminders")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
    }
}


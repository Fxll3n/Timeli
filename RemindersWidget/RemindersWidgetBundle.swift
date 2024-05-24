import WidgetKit
import SwiftUI
import Timeli // Make sure to import your main app module

@main
struct RemindersWidgetBundle: WidgetBundle {
    var body: some Widget {
        RemindWidget()
    }
}

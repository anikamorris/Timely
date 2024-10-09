//
//  TimelyApp.swift
//  Timely
//
//  Created by Anika Morris on 2/26/24.
//

import SwiftUI
import SwiftData

@main
struct TimelyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Timetable.self)
    }
}

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
            ContentView()
        }
        .modelContainer(for: Timetable.self)
    }
}

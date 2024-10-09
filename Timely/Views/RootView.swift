//
//  HomeView.swift
//  Timely
//
//  Created by Anika Morris on 10/1/24.
//

import SwiftUI

struct RootView: View {

    @Environment(\.modelContext) var modelContext
    @State private var path = [Timetable]()

    var body: some View {
        NavigationStack(path: $path) {
            TimetableListView()
                .navigationDestination(for: Timetable.self, destination: EditTimetableView.init)
                .navigationTitle("Timely")
                .toolbar {
                    Button("Add", systemImage: "plus", action: addTimetable)
                }
        }
    }

    func addTimetable() {
        let timetable = Timetable()
        modelContext.insert(timetable)
        path = [timetable]
    }

}

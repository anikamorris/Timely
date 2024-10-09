//
//  TimetableListView.swift
//  Timely
//
//  Created by Anika Morris on 10/1/24.
//

import SwiftUI
import SwiftData

struct TimetableListView: View {

    @Environment(\.modelContext) var modelContext
    @Query(sort: \Timetable.endTime) var timetables: [Timetable]

    var body: some View {
        List {
            ForEach(timetables) { timetable in
                NavigationLink(destination: TimetableDisplayView(timetable: timetable)) {
                    VStack(alignment: .leading) {
                        Text(timetable.name)
                            .font(.headline)
                        Text(timetable.endTime.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteTimetables)
        }
    }

    func deleteTimetables(_ indexSet: IndexSet) {
        for index in indexSet {
            let timetable = timetables[index]
            modelContext.delete(timetable)
        }
    }

}

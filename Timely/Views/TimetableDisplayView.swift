//
//  TimetableDisplayView.swift
//  Timely
//
//  Created by Anika Morris on 10/1/24.
//

import SwiftUI
import SwiftData

struct TimetableDisplayView: View {

    @Bindable var timetable: Timetable

    var body: some View {
        VStack {
            Text(timetable.endTime.formatted(date: .long, time: .omitted))
                .font(.title2)
                .padding()
            ForEach(timetableToSchedule(timetable)) { event in
                HStack {
                    Text(event.title)
                    Spacer()
                    Text(event.time)
                }
                .padding()
            }
            Spacer()
        }
        .navigationTitle("\(timetable.name)")
        .toolbar {
            NavigationLink {
                EditTimetableView.init(timetable: timetable)
            } label: {
                Text("Edit")
            }
        }
    }

    func timetableToSchedule(_ timetable: Timetable) -> [DisplayableEvent] {
        let departureEvent = DisplayableEvent(title: "Departure", time: "\(timetable.endTime.formatted(date: .omitted, time: .shortened))")
        var schedule = [departureEvent]
        guard let events = timetable.events else { return schedule }
        var lastTime = timetable.endTime
        for event in events.reversed() {
            let minutes = event.duration
            lastTime = lastTime.addMinutes(minutes: -minutes)
            let displayableEvent = DisplayableEvent(title: event.title, time: lastTime.formatted(date: .omitted, time: .shortened))
            schedule.append(displayableEvent)
        }
        return schedule.reversed()
    }

}

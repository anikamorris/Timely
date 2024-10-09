//
//  EditTimetableView.swift
//  Timely
//
//  Created by Anika Morris on 10/1/24.
//

import SwiftUI
import SwiftData

struct EditTimetableView: View {

    @Bindable var timetable: Timetable
    @State private var newEventName = ""
    @State private var newEventDuration = ""

    var body: some View {
        Form {
            TextField("Name", text: $timetable.name)
            DatePicker("Departure Time", selection: $timetable.endTime)

            Section("Events") {
                if let events = timetable.events {
                    ForEach(events) { event in
                        HStack {
                            Text(event.title)
                            Spacer()
                            Text("\(event.duration) minutes")
                        }
                    }
                }
                VStack {
                    Text("New Event")
                    TextField("Name", text: $newEventName)
                    TextField("Minutes", text: $newEventDuration)
                    Button("Add event", action: addNewEvent)
                }
            }
        }
        .navigationTitle("Edit Timetable")
        .navigationBarTitleDisplayMode(.inline)
    }

    func addNewEvent() {
        guard
            newEventName.isEmpty == false,
            newEventDuration.isEmpty == false,
            let duration = Int(newEventDuration)
        else { return }

        withAnimation {
            let event = Event(title: newEventName, duration: duration)
            if let _ = timetable.events {
                timetable.events?.append(event)
            } else {
                timetable.events = [event]
            }
            newEventName = ""
            newEventDuration = ""
        }
    }

}

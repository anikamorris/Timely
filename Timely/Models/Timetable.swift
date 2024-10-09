//
//  Timetable.swift
//  Timely
//
//  Created by Anika Morris on 2/26/24.
//

import Foundation
import SwiftData

@Model
class Timetable {
    var name: String
    @Relationship(deleteRule: .cascade) var events: [Event]?
    var endTime: Date

    init(name: String = "", events: [Event] = [], endTime: Date = .now) {
        self.name = name
        self.events = events
        self.endTime = endTime
    }
}

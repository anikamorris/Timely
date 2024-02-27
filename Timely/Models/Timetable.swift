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
    let name: String
    var events: [Event]
    var endTime: Date
    
    init(name: String, events: [Event], endTime: Date) {
        self.name = name
        self.events = events
        self.endTime = endTime
    }
}

@Model class Event {
    let title: String
    let duration: Int
    
    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }
}

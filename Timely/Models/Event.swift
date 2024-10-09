//
//  Event.swift
//  Timely
//
//  Created by Anika Morris on 10/1/24.
//

import Foundation
import SwiftData

@Model class Event {
    var title: String
    var duration: Int

    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }
}

struct DisplayableEvent: Identifiable {
    var id = UUID()
    var title: String
    var time: String
}

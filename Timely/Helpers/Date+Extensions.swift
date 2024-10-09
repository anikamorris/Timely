//
//  Date+Extensions.swift
//  Timely
//
//  Created by Anika Morris on 10/1/24.
//

import Foundation

extension Date {

    func addMinutes(minutes: Int) -> Date {
      return Calendar.current.date(byAdding: DateComponents(minute: minutes), to: self) ?? self
    }

}

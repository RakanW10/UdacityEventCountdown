//
//  Event.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct Event: Identifiable, Comparable {
    let id = UUID()
    let title: String
    let date: Date
    let textColor: Color
    
    
    static func < (lhs: Event, rhs: Event) -> Bool { lhs.date < rhs.date }
    static func > (lhs: Event, rhs: Event) -> Bool { lhs.date > rhs.date }
}

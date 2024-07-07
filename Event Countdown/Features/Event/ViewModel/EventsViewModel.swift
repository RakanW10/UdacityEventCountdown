//
//  EventsViewModel.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import Foundation


class EventsViewModel: ObservableObject{
    @Published private(set) var events: [Event] = []
    
    func add(event: Event){
        events.append(event)
        events.sort()
    }
    
    func delete(id: UUID) {
        events.removeAll {$0.id == id}
        events.sort()
    }
    
    func update(event: Event){
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            events[index] = event
        }
        events.sort()
    }
    
}

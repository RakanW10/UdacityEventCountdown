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
    }
    
    func delete(id: UUID) {
        events.removeAll {$0.id == id}
    }
    
    
}

//
//  EventsView.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventsView: View {
    private enum Mode: Hashable {
        case edit(event: Event)
        case add
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .edit(let event):
                hasher.combine(event.id)
            case .add:
                hasher.combine("add")
            }
        }
    }
    @StateObject var viewModel = EventsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.events) { event in
                    NavigationLink(value: Mode.edit(event: event)) {
                        EventItem(event: event)
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    viewModel.delete(id: event.id)
                                }
                            }
                        
                    }
                    
                }
            }
            .navigationTitle("Evnets")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: Mode.add) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Mode.self) { mode in
                switch mode {
                case .add:
                    EventFormView(){ newEvent in
                        viewModel.add(event: newEvent)
                    }
                    .navigationTitle("Add Event")
                case .edit(let event):
                    EventFormView(event: event){ newEvent in
                        viewModel.update(event: newEvent)
                    }
                    .navigationTitle("Edit \(event.title)")
                }
            }
        }
    }
}


#Preview {
    EventsView()
}


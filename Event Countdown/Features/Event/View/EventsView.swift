//
//  EventsView.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventsView: View {
    @StateObject var viewModel = EventsViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.events) { event in
                    NavigationLink {
                        EventFormView(event: event){ newEvent in
                            viewModel.update(event: newEvent)
                        }
                        .navigationTitle("Edit \(event.title)")
                    } label: {
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
                    NavigationLink {
                        EventFormView(){ newEvent in
                            viewModel.add(event: newEvent)
                        }
                        .navigationTitle("Add Event")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}


#Preview {
    EventsView()
}


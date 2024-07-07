//
//  EventsView.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("")
                } label: {
                    EventItem(title: "Title", date: .now)
                }
                .navigationTitle("Evnets")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            //TODO: Navigate to Add Event
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    EventsView()
}


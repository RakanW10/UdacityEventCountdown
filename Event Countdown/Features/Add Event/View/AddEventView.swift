//
//  AddEventView.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var eventViewModel: EventsViewModel
    @State var eventTitle = ""
    @State var eventDate = Date.now
    @State var eventTextColor = Color.blue
    
    var body: some View {
        Form {
            Section{
                TextField("Title", text: $eventTitle)
                DatePicker("Date", selection: $eventDate)
                ColorPicker("Text Color", selection: $eventTextColor)
            }
        }
        .navigationTitle("Add Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    guard !eventTitle.isEmpty else { return }
                    eventViewModel.add(event: .init(title: eventTitle, date: eventDate, textColor: eventTextColor))
                    dismiss()
                } label: {
                  Image(systemName: "checkmark")
                }
            }
        }
    }
}

#Preview {
    return NavigationStack {
        AddEventView(eventViewModel: EventsViewModel())
    }
}

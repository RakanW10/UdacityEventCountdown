//
//  EditEventView.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EditEventView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var eventViewModel: EventsViewModel
    @State var event: Event = .init(title: "", date: .now, textColor: .blue)
    
    var body: some View {
        Form {
            Section{
                TextField("Title", text: $event.title)
                DatePicker("Date", selection: $event.date)
                ColorPicker("Text Color", selection: $event.textColor)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    guard !event.title.isEmpty else { return }
                    eventViewModel.update(event: event)
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

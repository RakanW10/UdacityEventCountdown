//
//  EventFormView.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventFormView: View {
    @Environment(\.dismiss) var dismiss
    @State var event: Event = .init(title: "", date: .now, textColor: .blue)
    
    var onSave: (Event) -> ()
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
                    onSave(event)
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
        EventFormView(){ e in
            
        }
    }
}

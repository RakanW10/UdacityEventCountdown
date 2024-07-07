//
//  EventItem.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    var body: some View {
        VStack (alignment: .leading){
            Text(event.title)
                .font(.title3)
                .bold()
                .foregroundStyle(event.textColor)
            Text(event.date, formatter: RelativeDateTimeFormatter())
        }
    }
}

#Preview {
    EventItem(event: .init(title: "Title", date: .now + 100, textColor: .red))
}

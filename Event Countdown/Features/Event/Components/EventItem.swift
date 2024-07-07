//
//  EventItem.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventItem: View {
    let title: String
    let date: Date
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.title3)
                .bold()
                .foregroundStyle(.red)
            Text(date, formatter: RelativeDateTimeFormatter())
        }
    }
}

#Preview {
    EventItem(title: "Title", date: .now + 100)
}

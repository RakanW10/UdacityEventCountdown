//
//  EventItem.swift
//  Event Countdown
//
//  Created by Rakan Alotibi on 07/07/2024.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    @State var currentDate: Date = .now
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var relativeFormatter = RelativeDateTimeFormatter()
    
    init(event: Event) {
        self.event = event
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text(event.title)
                .font(.title3)
                .bold()
                .foregroundStyle(event.textColor)
            Text(relativeFormatter.localizedString(for: event.date, relativeTo: currentDate))
        }
        .onReceive(timer){ output in
            currentDate = output
        }
    }
}

#Preview {
    EventItem(event: .init(title: "Title", date: .now + 13, textColor: .red))
}

//
//  EventView.swift
//  PersonalDiary
//
//  Created by student on 20.01.2023..
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .foregroundStyle(event.color)
                .padding(.leading, 20)
                .padding(15)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .fontWeight(.bold)

                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .badge(event.remainingTaskCount)
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.example)
    }
}

//
//  PersonalDiaryApp.swift
//  PersonalDiary
//
//  Created by student on 17.01.2023..
//

import SwiftUI

@main
struct PersonalDiaryApp: App {
    
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            NavigationView {
                EventPlanerView()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
        }
    }
}

//
//  Event.swift
//  PersonalDiary
//
//  Created by student on 20.01.2023..
//

import Foundation
import SwiftUI

struct Event: Identifiable, Hashable{
    var id = UUID()
    var color: Color = ColorOptions.random()
    var title = ""
    var tasks = [EventTask(text: "")]
    var date = Date()
    
    var remainingTaskCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var isComplete: Bool {
        tasks.allSatisfy { $0.isCompleted }
    }
    
    static var example = Event(
        title: "Make mobile app",
        tasks: [
            EventTask(text: "Create Firebase"),
            EventTask(text: "Edit views"),
            EventTask(text: "Combine into one"),
        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
}

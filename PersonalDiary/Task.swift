//
//  Task.swift
//  PersonalDiary
//
//  Created by student on 20.01.2023..
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

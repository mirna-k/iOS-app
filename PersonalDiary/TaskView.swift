//
//  TaskView.swift
//  PersonalDiary
//
//  Created by student on 20.01.2023..
//

import SwiftUI

struct TaskView: View {
    @Binding var task: EventTask
    var isEditing: Bool
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            .padding(10)

            if isEditing || task.isNew {
                TextField("Task description", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }

            } else {
                Text(task.text)
            }

            Spacer()
        }
        .padding(.vertical, 10)
        .task {
            if task.isNew {
                isFocused = true
            }
        }
    }
        
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: .constant(EventTask(text: "Do something!")), isEditing: false)
    }
}


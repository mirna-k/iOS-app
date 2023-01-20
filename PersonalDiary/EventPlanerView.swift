//
//  EventPlanerView.swift
//  PersonalDiary
//
//  Created by student on 20.01.2023..
//

import SwiftUI

struct EventPlanerView: View {
    
    @EnvironmentObject var eventData: EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    
    var body: some View {
        VStack{
            HStack{
                Text("Event planer")
                    .font(.title)
                    .bold()
                    .padding(.top, 10)
                    .padding(20)
                Spacer()
            }
            Spacer()
            Section(content: {
                ForEach(eventData.sortedEvents()) { $event in
                    NavigationLink {
                        EventEditor(event: $event)
                    } label: {
                        EventView(event: event)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            eventData.delete(event)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            })
            .navigationTitle("Date Planner")
            .toolbar {
                ToolbarItem {
                    Button {
                        newEvent = Event()
                        isAddingNewEvent = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNewEvent) {
                NavigationView {
                    EventEditor(event: $newEvent, isNew: true)
                }
            }
        }
    }
}

struct EventPlanerView_Previews: PreviewProvider {
    static var previews: some View {
        EventPlanerView()
    }
}

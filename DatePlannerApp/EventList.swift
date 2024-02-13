//
//  EventList.swift
//  DatePlannerApp
//
//  Created by Anil Caliskan on 13.02.2024.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    
    var body: some View {
        Label(
            title: { Text(event.title) },
            icon: { Image(event.symbol) }
)
    }
}
struct EventList: View {
    //In DatePlannerApp, the top-level navigation view uses the .environmentObject modifier to pass in an instance of EventData, making it accessible to all of its child views. You can now access that data in this child view by declaring a variable with the @EnvironmentObject property wrapper and giving it the EventData type. You now have access to all of the prepopulated event data to create your list.
    @EnvironmentObject var eventData: EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    
    var body: some View {
        
        List {
            ForEach(Period.allCases) { period in
                if !eventData.sortedEvents(period: period).isEmpty {
                    Section(content: {
                        ForEach(eventData.sortedEvents(period: period)) { $event in
                            NavigationLink {
                                //EventEditor(event: $event)
                            } label: {
                                EventRow(event: event)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    eventData.delete(event)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }, header: {
                        Text(period.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
                }
            }
        }
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
                //EventEditor(event: $newEvent, isNew: true)
            }
        }
    }
}


struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventList().environmentObject(EventData())


        }
    }
}

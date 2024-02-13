//
//  DatePlannerAppApp.swift
//  DatePlannerApp
//
//  Created by Anil Caliskan on 13.02.2024.
//

import SwiftUI

@main
struct DatePlannerAppApp: App {
    //The app stores its data using the variable eventData. It’s defined with the @StateObject property wrapper to create an instance of an observable object, EventData. Because this object is observable, SwiftUI watches it to keep track of any changes to its values. Whenever the data changes, SwiftUI automatically updates all of the views that use (or observe) it.
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            //To navigate between different views in your app, create a NavigationView as the top-level view in your view hierarchy, inserting the app’s home view. For this app, EventList is that home view and the first view the app displays when it launches.
            NavigationView {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
        }
        //To make eventData available to your entire view hierarchy, use the .environmentObject modifier and pass in the eventData instance. Now you can use this data across all of your navigation view’s child views (and their child views as well).
        .environmentObject(eventData)
    }
}

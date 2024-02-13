//
//  EventTask.swift
//  DatePlannerApp
//
//  Created by Anil Caliskan on 13.02.2024.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

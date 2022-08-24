//
//  TrackedWorkout.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import Foundation

struct DailyWorkout: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var date: Date
    var workoutSets: [Workout]
    
    init(name: String, workoutSets: [Workout] = [], date: Date = Date()) {
        self.name           = name
        self.workoutSets    = workoutSets
        self.date           = date
    }
}

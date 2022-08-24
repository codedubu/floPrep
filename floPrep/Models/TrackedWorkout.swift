//
//  TrackedWorkout.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import Foundation

struct TrackedWorkout: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var workoutSets: [Workout]
    
    init(name: String, workoutSets: [Workout] = []) {
        self.name           = name
        self.workoutSets    = workoutSets
    }
}

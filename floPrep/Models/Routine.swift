//
//  Routine.swift
//  floPrep
//
//  Created by River McCaine on 8/10/22.
//

import Foundation

struct Routine: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var workoutTemplates: [Workout]
    var trackedWorkouts: [TrackedWorkout]
    
    init(name: String, workoutTemplates: [Workout] = [], trackedWorkouts: [TrackedWorkout] = []) {
        self.name               = name
        self.workoutTemplates   = workoutTemplates
        self.trackedWorkouts    = trackedWorkouts
    }
}

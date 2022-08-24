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
    var dailyWorkouts: [DailyWorkout]
    
    init(name: String, workoutTemplates: [Workout] = [], dailyWorkouts: [DailyWorkout] = []) {
        self.name               = name
        self.workoutTemplates   = workoutTemplates
        self.dailyWorkouts      = dailyWorkouts
    }
}

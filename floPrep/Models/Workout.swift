//
//  Workout.swift
//  floPrep
//
//  Created by River McCaine on 8/10/22.
//

import Foundation

struct Workout: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var sets: Int
    var reps: Int
    var weight: Int? = nil
    var workoutDate: Date
    var isCompleted: Bool = false
    
    init(name: String, sets: Int, reps: Int, weight: Int? = nil, workoutDate: Date = Date(), isCompleted: Bool = false) {
        self.name   = name
        self.sets   = sets
        self.reps   = reps
        self.weight = weight
        self.workoutDate = workoutDate
        self.isCompleted = isCompleted
    }
}

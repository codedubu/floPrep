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
    
    init(name: String, sets: Int, reps: Int, weight: Int? = nil) {
        self.name           = name
        self.sets           = sets
        self.reps           = reps
        self.weight         = weight
    }
}

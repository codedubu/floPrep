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
    var workouts: [Workout]
    
    init(name: String, workouts: [Workout] = []) {
        self.name       = name
        self.workouts   = workouts
    }
}

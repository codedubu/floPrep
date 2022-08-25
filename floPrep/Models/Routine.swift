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
    
    init(name: String, workoutTemplates: [Workout] = []) {
        self.name               = name
        self.workoutTemplates   = workoutTemplates
    }
}

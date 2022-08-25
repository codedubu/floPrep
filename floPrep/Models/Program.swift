//
//  Program.swift
//  floPrep
//
//  Created by River McCaine on 8/17/22.
//

import Foundation

struct Program: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var routines: [Routine]
    var trackedWorkouts: [Flow]
    
    init(name: String, routines: [Routine] = [], trackedWorkouts: [Flow] = []) {
        self.name       = name
        self.routines   = routines
        self.trackedWorkouts = trackedWorkouts
    }
}

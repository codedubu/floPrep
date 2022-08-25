//
//  Exercise.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import Foundation

struct Exercise: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var date: Date
    var sets: [Workout]
    
    init(name: String, sets: [Workout] = [], date: Date = Date()) {
        self.name           = name
        self.sets           = sets
        self.date           = date
    }
}

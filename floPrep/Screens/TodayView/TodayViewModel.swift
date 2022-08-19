//
//  TodayViewModel.swift
//  floPrep
//
//  Created by River McCaine on 8/15/22.
//

import Foundation
import SwiftUI

final class TodayViewModel: ObservableObject {
    
    @Published var storedWorkouts = [
        Workout(name: "Front Squat", sets: 3, reps: 5, weight: 185, workoutDate: Date(), isCompleted: true),
        Workout(name: "Overhead Press", sets: 3, reps: 5, weight: 95, workoutDate: Date(), isCompleted: true),
        Workout(name: "RDL", sets: 3, reps: 8, weight: 145, workoutDate: Date(), isCompleted: false),
        Workout(name: "Lat Pulldown", sets: 3, reps: 8, weight: 80, workoutDate: Date(), isCompleted: false),
        Workout(name: "Bicep Curls", sets: 2, reps: 10, weight: 30, workoutDate: Date(), isCompleted: false),
        Workout(name: "Ab Work", sets: 2, reps: 15, weight: 0, workoutDate: Date(), isCompleted: false)
    ]
    
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    @Published var filteredWorkouts: [Workout]?
    
    init() {
        retrieveCurrentWeek()
        filterTodayWorkouts()
    }
    
    
    func filterTodayWorkouts() {
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current
            let filtered = self.storedWorkouts.filter {
                return calendar.isDate($0.workoutDate, inSameDayAs: self.currentDay)
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredWorkouts = filtered
                }
            }
        }
    }
    
    
    func retrieveCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekday = week?.start else { return }
        
        (1...7) .forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekday) {
                currentWeek.append(weekday)
            }
        }
    }
    
    
    func extractDate(date: Date, format: String) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    
    func isToday(date: Date) -> Bool {
        
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}



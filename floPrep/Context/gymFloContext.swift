//
//  ProgramContext.swift
//  floPrep
//
//  Created by River McCaine on 8/17/22.
//

import Foundation
import Combine
import SwiftUI

class gymFloContext: ObservableObject {
    // MARK: - Data
    @Published var programs: [Program] = []
    @Published var trackedWorkouts: [Flow] = []
    
    // MARK: - Dates
    @Published var filteredWorkouts: [Flow]?
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    @Published var selectedDate: Date?
    
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        loadFromPersistenceStore()
        
        $programs
            .sink { [weak self] programs in
                self?.saveToPersistenceStore(programs: programs)
            }
            .store(in: &cancellables)
        
        $trackedWorkouts
            .sink { [weak self] trackedWorkouts in
                self?.saveToPersistenceStore(trackedWorkouts: trackedWorkouts)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - CRUD
    func createProgram(with name: String) {
        let program = Program(name: name)
        programs.append(program)
    }
    
    
    func deleteProgram(_ indexSet: IndexSet) {
        programs.remove(atOffsets: indexSet)
    }
    
    // MARK: - Date Methods
    func filterTodayWorkouts() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filteredWorkouts = self.trackedWorkouts.filter {
                return calendar.isDate($0.date!, inSameDayAs: self.currentDay)
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredWorkouts = filteredWorkouts
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


// MARK: - Data Persistence
extension gymFloContext {
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Program.json")
        return fileURL
    }
    
    
    func saveToPersistenceStore(programs: [Program]) {
        do {
            let data = try JSONEncoder().encode(programs)
            try data.write(to: fileURL())
            print("Programs: ", "File saved to\(data)")
            print(programs)
        } catch {
            print(error)
            print("Programs: ", "There was an error encoding \(error.localizedDescription)")
        }
    }
    
    
    func saveToPersistenceStore(trackedWorkouts: [Flow]) {
        do {
            let data = try JSONEncoder().encode(trackedWorkouts)
            try data.write(to: fileURL())
            print("TrackedWorkouts: ","File saved to\(data)")
            print(trackedWorkouts)
        } catch {
            print(error)
            print("TrackedWorkouts: ", "There was an error encoding \(error.localizedDescription)")
        }
    }
    
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let foundPrograms = try JSONDecoder().decode([Program].self, from: data)
            let foundWorkouts = try JSONDecoder().decode([Flow].self, from: data)
            
            programs        = foundPrograms
            trackedWorkouts = foundWorkouts
            print(programs, trackedWorkouts)
        } catch {
            print(error)
            print("There was an error decoding the data: \(error.localizedDescription)")
        }
    }
}

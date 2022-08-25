//
//  ProgramContext.swift
//  floPrep
//
//  Created by River McCaine on 8/17/22.
//

import Foundation
import Combine

class gymFloContext: ObservableObject {
    @Published var programs: [Program] = []
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        loadFromPersistenceStore()
        
        $programs
            .sink { [weak self] programs in
                self?.saveToPersistenceStore(programs: programs)
            }
            .store(in: &cancellables)
    }
    
    
    func createProgram(with name: String) {
        let program = Program(name: name)
        programs.append(program)
    }
    
    
    func deleteProgram(_ indexSet: IndexSet) {
        programs.remove(atOffsets: indexSet)
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
            print("File saved to\(data)")
        } catch {
            print(error)
            print("There was an error encoding \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let foundPrograms = try JSONDecoder().decode([Program].self, from: data)
            
            programs = foundPrograms
        } catch {
            print(error)
            print("There was an error decoding the data: \(error.localizedDescription)")
        }
    }
}

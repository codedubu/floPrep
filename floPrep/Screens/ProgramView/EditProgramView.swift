//
//  EditProgramView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct EditProgramView: View {
    @Binding var program: Program
    @State private var routineName = ""
        
    var body: some View {
        VStack {
            HStack {
                Text("Edit Program")
                    .font(.largeTitle)
            }
            
            TextField(program.name, text: $program.name)
                .frame(width: 300 , height: 100)
            
            TextField("Routine Name...", text: $routineName)
            
            RoutineView(routines: $program.routines)
            
            Button {
                createRoutine(with: routineName)
                routineName = ""
            } label: {
                Text("Save Routine")
            }
            
            NavigationLink(destination: TodayView(routines: $program.routines)) {
                TrainingButton()
            }
            .disabled(program.routines.isEmpty || program.name.isEmpty)
        }
    }
}

extension EditProgramView {
    
    func createRoutine(with name: String) {
        let newRoutine = Routine(name: name)
        program.routines.append(newRoutine)
    }
}

struct EditProgramView_Previews: PreviewProvider {
    static var previews: some View {
        EditProgramView(program: .constant(Program(name: "Fierce Five")))
    }
}

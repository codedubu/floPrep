//
//  EditProgramView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct EditProgramView: View {
    @Binding var program: Program
    
    @State var routineName = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Edit Program")
                    .font(.largeTitle)
            }
            
            TextField(program.name, text: $program.name)
                .frame(width: 300 , height: 100)
            
            Form {
                TextField("Enter routine...", text: $routineName )
            }
            .frame(height: 80)
            
            RoutineView(routines: $program.routines)
            
            Button("Save") {
                newRoutine()
            }.disabled(routineName.isEmpty)
            
            NavigationLink(destination: TodayView(routines: $program.routines)) {
                TrainingButton()
            }
            .disabled(program.routines.isEmpty || program.name.isEmpty)
        }
    }
}

extension EditProgramView {
    
    func newRoutine() {
        let newRoutine = Routine(name: routineName)
        program.routines.append(newRoutine)
        routineName = ""
    }
}

//
//struct EditProgramView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProgramView(program: )
//    }
//}



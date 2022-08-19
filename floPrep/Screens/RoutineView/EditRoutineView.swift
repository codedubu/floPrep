//
//  NewRoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct EditRoutineView: View {
    @Binding var routine: Routine
    
    var body: some View {
        VStack {
            HStack {
                Text("Edit Routine")
                    .font(.largeTitle)
            }
        }
        
        TextField("Routine name...", text: $routine.name )
            .frame(width: 300 , height: 100)
        
        Text("Workouts")
            .font(.title2.bold())
        
        WorkoutView(workouts: $routine.workouts)
        
        NavigationLink {
            NewWorkoutView(onSave: onSave)
        } label: {
            PlusButton()
        }
        
        TrainingButton()
            .disabled(routine.workouts.isEmpty || routine.name.isEmpty)
    }
    
    private func onSave(_ workout: Workout) {
        routine.workouts.append(workout)
    }
}


//struct NewRoutineView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditRoutineView(routine: <#Binding<Routine>#>)
//    }
//}

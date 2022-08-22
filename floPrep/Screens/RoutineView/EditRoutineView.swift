//
//  NewRoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct EditRoutineView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var routine: Routine
        
    var body: some View {
                
        VStack {
            HStack {
                Text("Edit Routine")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(x: 40)
                
                Button {
                    dismiss()
                } label: {
                    XDismissButton()
                }
                .frame(alignment: .trailing)
                .padding(.trailing, 22)
                
            }
            .padding(.top, 22)
            
                TextField("Routine name...", text: $routine.name )
                    .frame(width: 300 , height: 100)
                    .font(.title.bold())
            
            
            Text("Workouts")
                .font(.title2.bold())
            
            WorkoutView(workouts: $routine.workouts)
            NewWorkoutView(onSave: onSave)
            
        }
    }
}

extension EditRoutineView {
    
    private func onSave(_ workout: Workout) {
        routine.workouts.append(workout)
    }
}

struct EditRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EditRoutineView(routine: .constant(Routine(name: "A Day", workouts: [Workout(name: "Bench", sets: 3, reps: 5)])))
            EditRoutineView(routine: .constant(Routine(name: "A Day")))
        }
    }
}

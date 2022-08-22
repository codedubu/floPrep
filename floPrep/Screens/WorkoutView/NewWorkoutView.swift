//
//  EditWorkoutView.swift
//  floPrep
//
//  Created by River McCaine on 8/18/22.
//

import SwiftUI

struct NewWorkoutView: View {
    
    let onSave: (Workout) -> Void
    
    @State private var workout = Workout(name: "", sets: 0, reps: 0)
    
    var body: some View {
        VStack {
            HStack {
                TextField("Workout name...", text: $workout.name )
                    .frame(width: 186 , height: 100)
                
                Text("sets:")
                TextField("sets", value: $workout.sets, format: .number)
                
                Text("reps:")
                TextField("reps", value: $workout.reps, format: .number)
            }
            .padding(.horizontal, 22)
            
            Button {
                save()
                workout = Workout(name: "", sets: 0, reps: 0)
            } label: {
                PlusButton()
            }
            .disabled(workout.name.isEmpty)
        }
    }
}

extension NewWorkoutView {
    
    private func save() {
        onSave(workout)
    }
}

//struct NewWorkoutView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewWorkoutView()
//    }
//}

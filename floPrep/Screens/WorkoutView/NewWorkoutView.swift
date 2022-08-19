//
//  EditWorkoutView.swift
//  floPrep
//
//  Created by River McCaine on 8/18/22.
//

import SwiftUI

struct NewWorkoutView: View {
    
    let onSave: (Workout) -> Void
    
    @Environment(\.dismiss) private var dismiss
    @State private var workout = Workout(name: "", sets: 0, reps: 0)
    
    var body: some View {
        VStack {
            Text("Create Workout")
                .font(.largeTitle)
            
            HStack {
                TextField("Workout name...", text: $workout.name )
                    .frame(width: 224 , height: 100)
                
                TextField("Sets", value: $workout.sets, format: .number)
                TextField("Reps", value: $workout.reps, format: .number)
            }
            .padding(.horizontal, 22)
            
            Button {
                save()
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
        dismiss()
    }
}
//
//struct NewWorkoutView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewWorkoutView()
//    }
//}

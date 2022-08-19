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
    
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Edit Routine")
                    .font(.largeTitle)
                Button {
                   dismiss()
                } label: {
                    XDismissButton()
                }

            }
        }
        
        TextField("Routine name...", text: $routine.name )
            .frame(width: 300 , height: 100)
        
        Text("Workouts")
            .font(.title2.bold())
        
        WorkoutView(workouts: $routine.workouts)
        
        Button {
            showingSheet.toggle()
        } label: {
            PlusButton()
        }
        .sheet(isPresented: $showingSheet) {
            NewWorkoutView(onSave: onSave)
        }
    }
}

extension EditRoutineView {
    
    private func onSave(_ workout: Workout) {
        routine.workouts.append(workout)
    }
}

//struct NewRoutineView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditRoutineView(routine: <#Binding<Routine>#>)
//    }
//}

//
//  WorkoutCell.swift
//  floPrep
//
//  Created by River McCaine on 8/19/22.
//

import SwiftUI

struct WorkoutCell: View {
    
    @Binding var workout: Workout
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Workout name...", text: $workout.name)
                        .font(.title2.bold())
                    HStack {
                        TextField("sets", value: $workout.sets, format: .number)
                            .font(.title3)
                            .foregroundStyle(.black)
                            .frame(width: 32)
                            .multilineTextAlignment(.center)
                        Text("sets")
                            .font(.title3)
                            .foregroundStyle(.black)
                        Text("x")
                            .font(.title3)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 14)
                        TextField("reps", value: $workout.reps, format: .number)
                            .font(.title3)
                            .foregroundStyle(.black)
                            .frame(width: 32)
                            .multilineTextAlignment(.center)
                        Text("reps")
                            .font(.title3)
                            .foregroundStyle(.black)
                        
                    }
                    .hLeading()
                }
            }
        }
        .padding()
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}

struct WorkoutCell_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCell(workout: .constant(Workout(name: "Bench", sets: 3, reps: 5)))
    }
}

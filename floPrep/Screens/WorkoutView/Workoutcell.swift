//
//  Workoutcell.swift
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
                    Text(workout.name)
                        .font(.title2.bold())
                    HStack {
                        Text("\(workout.sets) sets")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Text("x")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal, 14)
                        Text("\(workout.reps) reps")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        
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

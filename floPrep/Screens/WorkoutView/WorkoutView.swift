//
//  WorkoutView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct WorkoutView: View {
    
    @Binding var workouts: [Workout]
    
    var body: some View {
        // if programs.routines.workouts.isEmpty
        //        Text("No workouts created. Type in the field above to add one!")
        //            .font(.system(size: 16))
        //            .fontWeight(.light)
        //            .offset(y: 100)
        List($workouts) { $workout in
            WorkoutCell(workout: $workout)
        }
    }
}


struct WorkoutCell: View {
    
    @Binding var workout: Workout
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(workout.name)
                        .font(.title2.bold())
                    HStack {
                        Text("145 lbs")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 28)
                        Text("\(workout.sets) sets")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Text("x")
                            .font(.title3)
                            .foregroundStyle(.secondary)
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

//struct WorkoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            WorkoutView()
//            WorkoutView()
//                .preferredColorScheme(.dark)
//        }
//    }
//}



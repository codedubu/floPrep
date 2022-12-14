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
        
        List($workouts) { $workout in
            WorkoutCell(workout: $workout)
        }
        .overlay(Group {
            if workouts.isEmpty {
                Text("No workouts created. Type in the field above to add one!")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .padding(.horizontal, 22)
            }
        })
    }
}

struct WorkoutView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            WorkoutView(workouts: .constant([Workout(name: "Bench", sets: 3, reps: 5), Workout(name: "Squat", sets: 3, reps: 5)]))
            WorkoutView(workouts: .constant([]))
                .preferredColorScheme(.dark)
        }
    }
}

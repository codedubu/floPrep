//
//  EditWorkoutView.swift
//  floPrep
//
//  Created by River McCaine on 8/18/22.
//

import SwiftUI

struct NewWorkoutView: View {
    
//    @Binding var workouts: [Workout]
    @State var workoutName = ""
    
    var body: some View {
            VStack {
                HStack {
                    Text("Edit Workout")
                        .font(.largeTitle)
                }
            
            TextField("Workout name...", text: $workoutName )
                .frame(width: 300 , height: 100)

            PlusButton()
            }
    }
}

struct EditWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView()
    }
}

//
//  NewRoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct NewRoutineView: View {
    
    @State var routineName = ""
    
    var body: some View {
        VStack {
            HStack {
                XDismissButton()
                Text("New Routine")
                    .font(.largeTitle)
            }
            TextField("Routine name...", text: $routineName )
                .frame(width: 300 , height: 100)
            
            WorkoutView()
            
            PlusDismissButton()
            
            if !routineName.isEmpty {
                TrainingButton()
                // also needs to check if workoutCell's all have values in them
                // workoutName needs to be filled
            }
        }
    }
}

struct TrainingButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 64)
                .foregroundColor(.brandSecondary)
            HStack(spacing: 12) {
                PlusDismissButton()
                Text("Start training")
                    .font(.title2)
            }
        }
        .frame(width: 264)
    }
}

struct NewRoutineButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 64)
                .foregroundColor(.brandSecondary)
            HStack(spacing: 12) {
                PlusDismissButton()
                Text("New Routine")
                    .font(.title2)
            }
        }
        .frame(width: 264)
    }
}

struct NewRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        NewRoutineView()
    }
}

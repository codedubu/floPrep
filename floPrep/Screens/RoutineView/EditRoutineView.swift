//
//  NewRoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct EditRoutineView: View {
    @Binding var routine: Routine
    @State var routineName = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Edit Routine")
                    .font(.largeTitle)
            }
        }
        
        TextField("Routine name...", text: $routine.name )
            .frame(width: 300 , height: 100)
        
        Text("Workouts")
            .font(.title2.bold())
        
        WorkoutView()
        PlusDismissButton()
        TrainingButton()
    }
}

struct TrainingButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 64)
                .foregroundColor(.brandSecondary)
            
            HStack(spacing: 12) {
                NavigationLink(destination:TodayView()) {
                    PlusDismissButton()
                    Text("Start training")
                        .font(.title2)
                }
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

//struct NewRoutineView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditRoutineView(routine: <#Binding<Routine>#>)
//    }
//}

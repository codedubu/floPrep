//
//  WorkoutView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct WorkoutView: View {
    
    var body: some View {
        // if programs.routines.workouts.isEmpty
        //        Text("No workouts created. Type in the field above to add one!")
        //            .font(.system(size: 16))
        //            .fontWeight(.light)
        //            .offset(y: 100)
        List {
            WorkoutCell(name: "Bench", sets: 3, reps: 5)
            WorkoutCell(name: "Squat", sets: 3, reps: 5)
            WorkoutCell(name: "Pendlay Row", sets: 3, reps: 5)
        }
    }
}



struct WorkoutCell: View {
    
    var name: String
    var sets: Int
    var reps: Int
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 10) {
                
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(name)
                        .font(.title2.bold())
                    HStack {
                        Text("145 lbs")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 28)
                        Text("\(sets) sets")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Text("x")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Text("\(reps) reps")
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

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutView()
            WorkoutView()
                .preferredColorScheme(.dark)
        }
    }
}



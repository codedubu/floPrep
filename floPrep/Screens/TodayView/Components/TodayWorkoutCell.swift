//
//  TodayWorkoutCell.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import SwiftUI

struct TodayWorkoutCell: View {
    
    let workout: Workout
    
    var body: some View {
            HStack(alignment: .top, spacing: 30) {
                VStack(spacing: 10) {
                    Circle()
                        .fill(workout.isCompleted ? Color.brandSecondary : .white)
                        .frame(width:15, height: 15)
                        .background(
                            Circle()
                                .stroke(.black, lineWidth: 1)
                                .padding(-3)
                        )
                    
                    Rectangle()
                        .fill(Color.brandPrimary)
                        .frame(width: 3)
                }
                
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
                        
                        Button {
                            // workout.isCompleted.toggle()
                            
                        } label: {
                            Image(systemName: workout.isCompleted ? "checkmark" : "pencil")
                                .padding(10)
                                .foregroundColor(.white)
                                .background(Color.brandSecondary, in: RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.top, 10)
                        
                    }
                }
                .foregroundColor(workout.isCompleted ?  .white : .black)
                .padding()
                .background(workout.isCompleted ? Color.brandPrimary : .white)
                .hLeading()
                .cornerRadius(12)
                
            }
            .hLeading()
        }
    }

struct TodayWorkoutCell_Previews: PreviewProvider {
    static var previews: some View {
        TodayWorkoutCell(workout: Workout(name: "Bench", sets: 3, reps: 5))
    }
}

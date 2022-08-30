//
//  TodayView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct TodayView: View {
    
    @ObservedObject var gymFloContext: gymFloContext
    @Binding var program: Program
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(gymFloContext.currentWeek, id: \.self) { day in
                                VStack(spacing: 10) {
                                    Text(gymFloContext.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Text(gymFloContext.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width:8, height: 8)
                                        .opacity(gymFloContext.isToday(date: day) ? 1 : 0)
                                }
                                .foregroundStyle(gymFloContext.isToday(date: day) ? .primary : .tertiary)
                                .foregroundColor(gymFloContext.isToday(date: day) ? .white : .brandPrimary)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack {
                                        if gymFloContext.isToday(date: day) {
                                            RoundedRectangle(cornerRadius: 14)
                                                .fill(Color.brandPrimary)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    })
                                .contentShape(RoundedRectangle(cornerRadius: 14))
                                .onTapGesture {
                                    withAnimation {
                                        gymFloContext.currentDay = day
                                        print(day)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    WorkoutsView()
                    
                } header: {
                    TodayViewHeader()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
    
    func WorkoutsView() -> some View {
        
        LazyVStack(spacing: 18) {
            
            if let workouts = gymFloContext.filteredWorkouts {
                
                if workouts.isEmpty {
                    Text("What's the plan, pal?")
                        .font(.title.bold())
                        .padding(.bottom, 64)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach($program.routines) { $routine in
                                RoutineCell(routine: routine, height: 164, width: 164)
                                    .onTapGesture {
                                        createDailyWorkouts(routine: &routine, templates: routine.workoutTemplates)
                                    }
                            }
                        }
                    }
                } else {
                    ForEach($gymFloContext.trackedWorkouts) { $flow in
                            TodayWorkoutCardView(flow: $flow)
                    }
                }
            }
        }
        .onChange(of: gymFloContext.currentDay) { newValue in
            gymFloContext.filterTodayWorkouts()
        }
        .padding()
        .padding(.top)
    }
    
    
    func createDailyWorkouts(routine: inout Routine, templates: [Workout]) {
        for template in templates {
            var newFlow = Flow(name: template.name, date: gymFloContext.currentDay)
            
            for _ in 0..<template.sets {
                let newWorkoutSet = Workout(name: template.name, sets: template.sets, reps: template.reps)
                newFlow.sets.append(newWorkoutSet)
            }
            
            gymFloContext.trackedWorkouts.append(newFlow)
        }
    }
}

//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
//

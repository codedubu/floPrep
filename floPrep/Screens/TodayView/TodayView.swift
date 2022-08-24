//
//  TodayView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct TodayView: View {
    
    @Namespace var animation
    
    @StateObject var viewModel = TodayViewModel()
    @Binding var routines: [Routine]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 10) {
                            
                            ForEach(viewModel.currentWeek, id: \.self) { day in
                                
                                VStack(spacing: 10) {
                                    Text(viewModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Text(viewModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width:8, height: 8)
                                        .opacity(viewModel.isToday(date: day) ? 1 : 0)
                                }
                                .foregroundStyle(viewModel.isToday(date: day) ? .primary : .tertiary)
                                .foregroundColor(viewModel.isToday(date: day) ? .white : .brandPrimary)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack {
                                        if viewModel.isToday(date: day) {
                                            RoundedRectangle(cornerRadius: 14)
                                                .fill(Color.brandPrimary)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(RoundedRectangle(cornerRadius: 14))
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.currentDay = day
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
            
            if let workouts = viewModel.filteredWorkouts {
                
                if workouts.isEmpty {
                    Text("What's the plan, pal?")
                        .font(.title.bold())
                        .padding(.bottom, 64)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(routines) { routine in
                                RoutineCell(routine: routine, height: 164, width: 164)
                            }
                        }
                        .onTapGesture {
                            // the above scroll view changes into a WorkoutsView??
                        }
                    }
                } else {
                    
                    Text("B Day")
                        .font(.title.bold())
                    
                    ForEach(workouts) { workout in
                        TodayWorkoutCell(workout: workout)
                    }
                }
            }
        }
        .onChange(of: viewModel.currentDay) { newValue in
            viewModel.filterTodayWorkouts()
        }
        .padding()
        .padding(.top)
        
    }
}



//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
//

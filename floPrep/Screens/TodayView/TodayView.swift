//
//  TodayView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject var viewModel = TodayViewModel()
    @Namespace var animation
    
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
                                            Capsule()
                                                .fill(Color.brandPrimary)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
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
                    HeaderView()
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
                            RoutineCell(name: "Chest", height: 164, width: 164)
                            RoutineCell(name: "Back", height: 164, width: 164)
                            RoutineCell(name: "Legs", height: 164, width: 164)
                            RoutineCell(name: "Explosive", height: 164, width: 164)
                        }
                    }
                } else {
                    
                    Text("B Day")
                        .font(.title.bold())
                    
                    ForEach(workouts) { workout in
                        WorkoutCell(workout: workout)
                    }
                }
                
            } else {
                ProgressView()
                    .offset(y: 100)
            }
            
        }
        .onChange(of: viewModel.currentDay) { newValue in
            viewModel.filterTodayWorkouts()
        }
        .padding()
        .padding(.top)
        
    }
    
    
    func WorkoutCell(workout: Workout) -> some View {
        
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
            .hLeading()
            .background(workout.isCompleted ? Color.brandPrimary : .white)
            .cornerRadius(12)
            
        }
        .hLeading()
    }
    
    
    func HeaderView() -> some View {
        HStack(spacing: 10) {
            
            Button {
                
            } label: {
                Image(systemName: "list.bullet")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 28 , height:  28)
                    .tint(.brandPrimary)
            }
            
            VStack(alignment: .trailing, spacing: 10) {
                Text("Today")
                    .font(.largeTitle.bold())
                
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                
            }
            .hCenter()
            
            Button {
                
            } label: {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 34 , height:  34)
                    .tint(.brandPrimary)
            }
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(.white)
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}


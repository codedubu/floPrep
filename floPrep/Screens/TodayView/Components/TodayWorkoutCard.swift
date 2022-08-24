//
//  TodayWorkoutCard.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import SwiftUI

struct WorkoutCardView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            VStack {
                WorkoutHeader()
                List {
                    ForEach(0..<3) { _ in
                        TodayWorkoutSetCell(setNumber: 1)
                    }
//                    .onDelete(perform: appContext.deleteWorkout)
                    .listRowSeparator(.hidden)
                    .padding(.horizontal, 22)
                }
                .listStyle(.plain)
                
                Button {
                    print("Added")
                } label: {
                    AddButton()
                }
            }
        }
        .frame(height: 284)
        .padding(.horizontal, 8)
    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        WorkoutCardView()
    }
}


struct WorkoutHeader: View {
    
    @Environment(\.editMode) var editingThang
    @State var isEditing = false
    
    var body: some View {
        HStack {
            Text("Bench")
                .font(.title.bold())
            Spacer()
            Button {
                isEditing.toggle()
                if isEditing == false {
                    editingThang?.wrappedValue = .inactive
                } else {
                    editingThang?.wrappedValue = .active
                }
            } label: {
                DotEditButton()
            }
        }
        .padding(.top, 22)
        .padding(.horizontal, 28)
        .padding(.bottom, 12)
    }
}


struct DotEditButton: View {
    
    var body: some View {
        HStack {
            Dot()
            Dot()
            Dot()
        }
    }
}


struct TodayWorkoutSetCell: View {
    
    var setNumber: Int
    
    var body: some View {
        HStack(spacing: 54) {
            Text("\(setNumber)")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
            Text("145 lbs")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
            Text("x")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
            Text("5 reps")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
        }
    }
}


struct AddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 44, height: 44)
                .foregroundColor(.indigo)
            Image(systemName: "plus")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(.black)
        }
        .padding(.bottom, 8)
    }
}

struct Dot: View {
    
    let widthPadding: CGFloat    = 14
    let heightPadding: CGFloat   = 14
    
    var body: some View {
        Circle()
            .frame(width: widthPadding, height: heightPadding)
            .foregroundColor(.black)
    }
}

//
//  TodayWorkoutCard.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import SwiftUI

struct TodayWorkoutCardView: View {
    
    @Binding var flow: Flow
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            VStack {
                WorkoutHeader(flow: $flow)
                List {
                    ForEach($flow.sets) { $singleSet in
                        
                        let setIndex = flow.sets.firstIndex(where: { $0.id == singleSet.id})!
                        
                        TodayWorkoutSetCell(singleSet: $singleSet, setNumber: "\(setIndex + 1)")
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteSingleSet(index: setIndex)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                .tint(.brandPrimary)
                            }
                    }
                    .listRowSeparator(.hidden)
                    .padding(.horizontal, 22)
                }
                .listStyle(.plain)
                
                Button {
                    
                } label: {
                    AddButton()
                }
            }
        }
        .frame(height: 284)
        .padding(.horizontal, 8)
    }
}

struct WorkoutHeader: View {
    
    @Environment(\.editMode) var editingThang
    @State var isEditing = false
    
    @Binding var flow: Flow
    
    var body: some View {
        HStack {
            Text(flow.name)
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
    
    @Binding var singleSet: Workout
    var setNumber: String
    
    var body: some View {
        
        HStack(spacing: 44) {
            Text(setNumber)
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
            
            TextField("Weight..", value: $singleSet.weight, format: .number)
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
            Text("x")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.65)
            TextField("reps", value: $singleSet.reps, format: .number)
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
                .foregroundColor(.brandPrimary)
            Image(systemName: "plus")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
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

extension TodayWorkoutCardView {
    
    func deleteSingleSet(index: Int) {
        flow.sets.remove(at: index)
    }
}


//struct TodayWorkoutCardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        WorkoutCardView()
//    }
//}

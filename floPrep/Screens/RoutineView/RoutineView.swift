//
//  RoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct RoutineView: View {
    @Binding var routines: [Routine]
    
    var body: some View {
        Text("No routines created. Type in the field above to add one!")
            .font(.system(size: 16))
            .fontWeight(.light)
            .offset(y: 100)
        
        List {
            ForEach($routines) { $routine in
                NavigationLink(destination: EditRoutineView(routine: $routine)) {
                    RoutineCell(routine: routine, height: 150)
                }
            }
            .onDelete(perform: deleteRoutine)
        }
    }
}

struct RoutineCell: View {
    
    let routine: Routine
    
    var height: CGFloat
    var width: CGFloat?
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(.brandPrimary)
            Text(routine.name)
                .font(.title)
                .foregroundColor(.white)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}
//struct RoutineView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoutineView()
//    }
//}


extension RoutineView {
    
    func deleteRoutine(_ indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
}

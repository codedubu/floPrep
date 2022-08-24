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
        List {
            ForEach($routines) { $routine in
                NavigationLink(destination: EditRoutineView(routine: $routine)) {
                    RoutineCell(routine: routine, height: 150)
                }
            }
            .onDelete(perform: deleteRoutine)
        }
        .disabled(routines.isEmpty)
        .overlay {
            if routines.isEmpty {
             EmptyStateView(message: "No routines created. Type in the field below to add one!")
            }
        }
    }
}

extension RoutineView {
    
    func deleteRoutine(_ indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoutineView(routines: .constant([Routine(name: "A Day"), Routine(name: "B Day")]))
            RoutineView(routines: .constant([]))
        }
    }
}

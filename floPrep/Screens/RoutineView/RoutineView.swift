//
//  RoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct RoutineView: View {
    @Binding var routines: [Routine]
    @State private var showingSheet = false
    @State var selectedRoutine: Routine? = nil
        
    var body: some View {
        List {
            ForEach($routines) { $routine in
                RoutineCell(routine: routine, height: 150)
                    .onTapGesture {
                        selectedRoutine = routine
                    }
                    .sheet(item: $selectedRoutine, onDismiss: { selectedRoutine = nil } ) { _ in
                        EditRoutineView(routine: Binding($selectedRoutine)!)
                    }
            }
            .onDelete(perform: deleteRoutine)
        }
        .disabled(routines.isEmpty)
    }
}

extension RoutineView {
    
    func deleteRoutine(_ indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
}

//struct RoutineView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RoutineView(routines: .constant([Routine(name: "A Day"), Routine(name: "B Day")]))
//            RoutineView(routines: .constant([]))
//        }
//    }
//}

//Text("No routines created. Type in the field above to add one!")
//    .font(.system(size: 16))
//    .fontWeight(.light)
//    .offset(y: 100)
//    .disabled(!routines.isEmpty)

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
    
    var body: some View {
        Text("No routines created. Type in the field above to add one!")
            .font(.system(size: 16))
            .fontWeight(.light)
            .offset(y: 100)
        
        List {
            ForEach($routines) { $routine in
                RoutineCell(routine: routine, height: 150)
                    .onTapGesture {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        EditRoutineView(routine: $routine)
                    }
            }
            .onDelete(perform: deleteRoutine)
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


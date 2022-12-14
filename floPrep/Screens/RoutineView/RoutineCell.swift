//
//  RoutineCell.swift
//  floPrep
//
//  Created by River McCaine on 8/19/22.
//

import SwiftUI

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

struct RoutineCell_Previews: PreviewProvider {
    static var previews: some View {
        RoutineCell(routine: Routine(name: "A Day"), height: 160)
    }
}

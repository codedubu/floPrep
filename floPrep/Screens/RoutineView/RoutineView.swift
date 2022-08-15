//
//  RoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct RoutineView: View {
    var body: some View {
        
        // if programs.routines.isEmpty
//        Text("No routines created. Type in the field above to add one!")
//            .font(.system(size: 16))
//            .fontWeight(.light)
//            .offset(y: 100)
        
        List {
            RoutineCell(name: "A Day", height: 74)
            RoutineCell(name: "B Day", height: 74)
        }
    }
}


struct RoutineCell: View {
    
    var name: String
    var height: CGFloat
    var width: CGFloat?
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(.brandPrimary)
            Text(name)
                .font(.title)
                .foregroundColor(.white)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}

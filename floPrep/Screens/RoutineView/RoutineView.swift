//
//  RoutineView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct RoutineView: View {
    var body: some View {
        List {
            RoutineCell(name: "A Day")
            RoutineCell(name: "B Day")
        }
    }
}


struct RoutineCell: View {
    
    var name: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 74)
                .foregroundColor(.brandSecondary)
            Text(name)
                .font(.title)
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

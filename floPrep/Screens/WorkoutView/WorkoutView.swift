//
//  WorkoutView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        List {
            WorkoutCell(name: "Bench")
            WorkoutCell(name: "Squat")
            WorkoutCell(name: "Pendlay Row")
        }
        
    }
}

struct WorkoutCell: View {
    
    var name: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 74)
                .foregroundColor(.brandSecondary)
            HStack {
                Text(name)
                    .font(.title2)
                Text("3")
                    .font(.title3)
                Text("x")
                    .font(.title3)
                Text("5")
                    .font(.title3)

            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}



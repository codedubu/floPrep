//
//  NewRoutineButton.swift
//  floPrep
//
//  Created by River McCaine on 8/19/22.
//

import SwiftUI

struct NewRoutineButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 64)
                .foregroundColor(.brandSecondary)
            HStack(spacing: 12) {
                PlusButton()
                Text("New Routine")
                    .font(.title2)
            }
        }
        .frame(width: 264)
    }
}

struct NewRoutineButton_Previews: PreviewProvider {
    static var previews: some View {
        NewRoutineButton()
    }
}

//
//  TrainingButton.swift
//  floPrep
//
//  Created by River McCaine on 8/19/22.
//

import SwiftUI

struct TrainingButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 64)
                .foregroundColor(.brandPrimary)
            
            HStack(spacing: 12) {
                    Text("Start training")
                        .font(.title2)
                        .foregroundColor(.white)
            }
        }
        .frame(width: 264)
    }
}

struct TrainingButton_Previews: PreviewProvider {
    static var previews: some View {
        TrainingButton()
    }
}

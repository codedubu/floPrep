//
//  EmptyStateView.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import SwiftUI

struct EmptyStateView: View {
    
    var message: String
    
    var body: some View {
        Text(message)
            .font(.title2)
            .fontWeight(.light)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 12)
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(message: "No routines created. Type in the field above to add one!")
    }
}

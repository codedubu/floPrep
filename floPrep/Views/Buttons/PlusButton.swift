//
//  PlusDismissButton.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 40, height: 40)
                .foregroundColor(.brandPrimary)
                .opacity(0.6)
        
            Image(systemName: "plus")
                .imageScale(.small)
                .frame(width: 54, height: 54)
                .foregroundColor(.black)
        }
    }
}

struct PlusDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}

//
//  ProgramCell.swift
//  floPrep
//
//  Created by River McCaine on 8/19/22.
//

import SwiftUI

struct ProgramCell: View {
    let program: Program
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 74)
                .foregroundColor(.brandPrimary)
            Text(program.name)
                .font(.title)
                .foregroundColor(.white)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct ProgramCell_Previews: PreviewProvider {
    static var previews: some View {
        ProgramCell(program: Program(name: "Fierce Five"))
    }
}

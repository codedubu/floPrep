//
//  ProgramView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct ProgramView: View {
        
    @State var programName = ""
    
    var body: some View {
        
        VStack {
            Text("Programs")
            TextField("Program name...", text: $programName)
                .frame(width: 300 , height: 100)
            
//            if programs.isEmpty {
//                Text("No programs created. Type in the field above to add one!")
//                    .font(.system(size: 16))
//                    .fontWeight(.light)
//                    .offset(y: 100)
//            }
            
            List {
                ForEach(0..<1) { _ in
                    NavigationLink(destination: EditProgramView()) {
                        ProgramCell()
                    }
                }
                
                if !programName.isEmpty {
                    Button("Save") {
                        //append(newProgram) to list above.
                        print("Program saved.")
                        //programName = ""
                    }
                }
            }
        }
    }
}

struct ProgramCell: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 74)
                .foregroundColor(.brandPrimary)
            Text("Fierce Five")
                .font(.title)
                .foregroundColor(.white)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView()
    }
}


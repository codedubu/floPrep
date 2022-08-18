//
//  ProgramView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct ProgramView: View {
    @ObservedObject var gymFloContext: gymFloContext
    
    @State var programName = ""
    
    var body: some View {
        
        VStack {
            Text("Programs")
            TextField("Program name...", text: $programName)
                .frame(width: 300 , height: 100)
            
            //            Text("No programs created. Type in the field above to add one!")
            //                .font(.system(size: 16))
            //                .fontWeight(.light)
            List {
                ForEach($gymFloContext.programs) { $program in
                    NavigationLink(destination: EditProgramView(program: $program)) {
                        ProgramCell(program: program)
                    }
                }
                .onDelete(perform: gymFloContext.deleteProgram)
            }
            
            Button("Save") {
                gymFloContext.createProgram(with: programName)
                print("Program saved.")
                programName = ""
            }
            .disabled(programName.isEmpty)
        }
    }
}


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

struct ProgramView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ProgramView(gymFloContext: gymFloContext())
        }
    }
}


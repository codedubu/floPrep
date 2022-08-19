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

struct ProgramView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ProgramView(gymFloContext: gymFloContext())
        }
    }
}


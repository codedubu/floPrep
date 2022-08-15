//
//  ProgramView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct ProgramView: View {
    
    @State var programName = ""
    @StateObject var viewModel = ProgramViewModel()
    
    var body: some View {
        
        VStack {
            Text("Programs")
            TextField("Program name...", text: $programName)
                .frame(width: 300 , height: 100)
            
            List {
                ForEach(0..<1) { _ in
                    NavigationLink(destination: EditProgramView(isShowingEditProgramView: $viewModel.isShowingDetailView)) {
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


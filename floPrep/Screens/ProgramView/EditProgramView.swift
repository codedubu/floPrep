//
//  EditProgramView.swift
//  floPrep
//
//  Created by River McCaine on 8/14/22.
//

import SwiftUI

struct EditProgramView: View {
    
    @Binding var isShowingEditProgramView: Bool
    @State var programName = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 44) {
                XDismissButton()
                // go back to programView
                Text("Edit Program")
                    .font(.largeTitle)
                PlusDismissButton()
                // go back to programView?? wat
            }
            
            TextField("Fierce Five", text: $programName)
                .frame(width: 300 , height: 100)
            
            RoutineView()
            
            NavigationLink(destination: NewRoutineView()) {
                NewRoutineButton()
            }
        }
    }
}

struct EditProgramView_Previews: PreviewProvider {
    static var previews: some View {
        EditProgramView(isShowingEditProgramView: .constant(false))
    }
}

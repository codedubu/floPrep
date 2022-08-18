//
//  floPrepApp.swift
//  floPrep
//
//  Created by River McCaine on 8/10/22.
//

import SwiftUI

@main
struct floPrepApp: App {
    @StateObject private var programContext = gymFloContext()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProgramView(gymFloContext: programContext)
            }
            .navigationViewStyle(.stack)
        }
    }
}

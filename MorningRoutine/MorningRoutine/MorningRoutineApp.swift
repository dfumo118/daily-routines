//
//  MorningRoutineApp.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

@main
struct MorningRoutineApp: App {
    
    @StateObject var actionListViewModel : ActionListViewModel = ActionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ActionListView()
            }
            .environmentObject(actionListViewModel)
        }
    }
}

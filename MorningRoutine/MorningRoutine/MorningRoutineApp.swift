//
//  MorningRoutineApp.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

@main
struct MorningRoutineApp: App {
    
    @StateObject var routineListViewModel : RoutineListViewModel = RoutineListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RoutineListView()
            }
            .environmentObject(routineListViewModel)
        }
    }
}

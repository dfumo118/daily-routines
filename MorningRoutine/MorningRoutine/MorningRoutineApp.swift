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
                ActionListView(routine: RoutineModel(name: "Routine", actions: [
                    ActionModel(title: "Hi", time: 120),
                    ActionModel(title: "Hello", time: 150),
                    ActionModel(title: "Hey there", time: 100)
                ]))
            }
            .environmentObject(routineListViewModel)
        }
    }
}

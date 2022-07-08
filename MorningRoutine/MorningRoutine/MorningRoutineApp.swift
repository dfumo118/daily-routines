//
//  MorningRoutineApp.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

@main
struct MorningRoutineApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView(type: .actn)
            }
            .environmentObject(listViewModel)
        }
    }
}

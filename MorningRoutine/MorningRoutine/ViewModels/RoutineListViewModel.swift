//
//  RoutineListViewModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import Foundation
import SwiftUI

class RoutineListViewModel : ObservableObject {
    @Published var routines : [RoutineModel]
    
    init() {
        self.routines = [
            RoutineModel(name: "Routine 1", actions: [
                ActionModel(title: "Hi", time: 120),
                ActionModel(title: "Hello", time: 150),
                ActionModel(title: "Hey there", time: 100)
            ]),
            RoutineModel(name: "Routine 2", actions: [
                ActionModel(title: "Hi", time: 120),
                ActionModel(title: "Hello", time: 150),
                ActionModel(title: "Hey there", time: 100)
            ]),
            RoutineModel(name: "Routine 3", actions: [
                ActionModel(title: "Hi", time: 120),
                ActionModel(title: "Hello", time: 150),
                ActionModel(title: "Hey there", time: 100)
            ])
        ]
    }
    
    func deleteRoutine(indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
    
    func moveRoutine(from: IndexSet, to: Int) {
        routines.move(fromOffsets: from, toOffset: to)
    }
    
    func addRoutine(name: String, color: UIColor) {
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        guard color.getRed(&r, green: &g, blue: &b, alpha: &a) else {return}
        let newRoutine = RoutineModel(name: name, color:[r,g,b], actions: [])
                
        routines.append(newRoutine)
    }
}

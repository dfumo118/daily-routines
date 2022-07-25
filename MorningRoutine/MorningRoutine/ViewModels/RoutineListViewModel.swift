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
    
    func addRoutine(name: String, color: UIColor, actions: [ActionModel]) {
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        guard color.getRed(&r, green: &g, blue: &b, alpha: &a) else {return}
        let newRoutine = RoutineModel(name: name, color:[r,g,b], actions: actions)
                
        routines.append(newRoutine)
    }
    
    func changeName(num: Int, name: String) {
        routines[num].name = name
    }
    
    func changeActions(num: Int, actions: [ActionModel]) {
        routines[num].actions = actions
    }
    
    func deleteAction(num: Int, indexSet: IndexSet) {
        routines[num].actions.remove(atOffsets: indexSet)
    }
    
    func moveAction(num: Int, from: IndexSet, to: Int) {
        routines[num].actions.move(fromOffsets: from, toOffset: to)
    }
    
    func addAction(num: Int, title: String, time: Int) {
        let newAction = ActionModel(title: title, time: time)
        routines[num].actions.append(newAction)
    }
}

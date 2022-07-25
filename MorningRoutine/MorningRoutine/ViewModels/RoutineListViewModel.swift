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
    
    func getRGB(color: UIColor) -> [Double] {
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        guard color.getRed(&r, green: &g, blue: &b, alpha: &a) else {return [0,0,0]}
        return [r,g,b]
    }
    
    func deleteRoutine(indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
    
    func moveRoutine(from: IndexSet, to: Int) {
        routines.move(fromOffsets: from, toOffset: to)
    }
    
    func addRoutine(name: String, color: UIColor, actions: [ActionModel]) {
        let newColor = getRGB(color: color)
        let newRoutine = RoutineModel(name: name, actions: actions, color: newColor)
                
        routines.append(newRoutine)
    }
    
    func changeName(num: Int, name: String) {
        routines[num].name = name
    }
    
    func changeColor(num: Int, color: UIColor) {
        let newColor = getRGB(color: color)
        print(newColor)
        routines[num].color = newColor
    }
    
    func deleteAction(num: Int, indexSet: IndexSet) {
        routines[num].time -= indexSet.map({routines[num].actions[$0].time}).reduce(0,+)
        routines[num].actions.remove(atOffsets: indexSet)
    }
    
    func moveAction(num: Int, from: IndexSet, to: Int) {
        routines[num].actions.move(fromOffsets: from, toOffset: to)
    }
    
    func addAction(num: Int, title: String, time: Int) {
        let newAction = ActionModel(title: title, time: time)
        routines[num].actions.append(newAction)
        routines[num].time += time
    }
    
    func editAction(num: Int, action: ActionModel, time: Int) {
        let actionNum = routines[num].actions.firstIndex{$0 == action}
        if actionNum != nil {
            routines[num].time += time - routines[num].actions[actionNum!].time
            routines[num].actions[actionNum!].time = time
        }
    }
}

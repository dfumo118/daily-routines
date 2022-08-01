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
    
    func findRoutine(id: String) -> Int {
        return routines.firstIndex{$0.id == id} ?? 0
    }
    
    func deleteRoutine(indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
    
    func moveRoutine(from: IndexSet, to: Int) {
        routines.move(fromOffsets: from, toOffset: to)
        print(routines.map({$0.name}))
    }
    
    func addRoutine(name: String, color: UIColor, actions: [ActionModel]) {
        let newColor = getRGB(color: color)
        let newRoutine = RoutineModel(name: name, actions: actions, color: newColor)
                
        routines.append(newRoutine)
    }
    
    func changeName(routine: RoutineModel, name: String) {
        routines[findRoutine(id: routine.id)].name = name
    }
    
    func changeColor(routine: RoutineModel, color: UIColor) {
        let newColor = getRGB(color: color)
        routines[findRoutine(id: routine.id)].color = newColor
    }
    
    func deleteAction(id: String, indexSet: IndexSet) {
        let num = findRoutine(id: id)
        routines[num].time -= indexSet.map({routines[num].actions[$0].time}).reduce(0,+)
        routines[num].actions.remove(atOffsets: indexSet)
    }
    
    func moveAction(id: String, from: IndexSet, to: Int) {
        let num = findRoutine(id: id)
        routines[num].actions.move(fromOffsets: from, toOffset: to)
    }
    
    func addAction(id: String, title: String, time: Int) {
        let num = findRoutine(id: id)
        let newAction = ActionModel(title: title, time: time)
        routines[num].actions.append(newAction)
        routines[num].time += time
    }
    
    func editAction(id: String, action: ActionModel, time: Int) {
        let num = findRoutine(id: id)
        let actionNum = routines[num].actions.firstIndex{$0 == action}
        if actionNum != nil {
            routines[num].time += time - routines[num].actions[actionNum!].time
            routines[num].actions[actionNum!].time = time
        }
    }
}

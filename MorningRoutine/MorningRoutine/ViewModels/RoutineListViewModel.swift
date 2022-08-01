//
//  RoutineListViewModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import Foundation
import SwiftUI

class RoutineListViewModel : ObservableObject {
    @Published var routines : [RoutineModel] {
        didSet {
            saveRoutines()
        }
    }
    
    let routinesKey = "routines_list"
    
    init() {
        self.routines = []
        getRoutines()
    }
    
    func getRoutines() {
        guard
            let data = UserDefaults.standard.data(forKey: routinesKey),
            let savedRoutines = try? JSONDecoder().decode([RoutineModel].self, from: data)
        else { return }
        
        self.routines = savedRoutines
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
    
    func getRoutineById(id: String) -> RoutineModel {
        return routines[findRoutine(id: id)]
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
    
    func changeName(id: String, name: String) {
        routines[findRoutine(id: id)].name = name
    }
    
    func changeColor(id: String, color: UIColor) {
        let newColor = getRGB(color: color)
        routines[findRoutine(id: id)].color = newColor
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
    
    func saveRoutines() {
        if let encodedData = try? JSONEncoder().encode(routines) {
            UserDefaults.standard.set(encodedData, forKey: routinesKey)
        }
    }
}

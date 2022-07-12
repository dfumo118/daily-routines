//
//  ListViewModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

class ActionListViewModel : ObservableObject {
    @Published var routine : RoutineModel
    
    init(routine: RoutineModel) {
        self.routine = routine
    }
    
    func deleteAction(indexSet: IndexSet) {
        routine.actions.remove(atOffsets: indexSet)
    }
    
    func moveAction(from: IndexSet, to: Int) {
        routine.actions.move(fromOffsets: from, toOffset: to)
    }
    
    func addAction(title: String, time: Int) {
        let newAction = ActionModel(title: title, time: time)
        routine.actions.append(newAction)
    }
    
    func replaceAction(old: Int, new: ActionModel) {
        routine.actions.remove(at: old)
        routine.actions.insert(new, at: old)
    }
}

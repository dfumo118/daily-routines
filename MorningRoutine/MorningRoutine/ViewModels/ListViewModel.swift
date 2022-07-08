//
//  ListViewModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var actions : [ActionModel] = []
    
    init() {
        getActions()
    }
    
    func getActions() {
        let newActions = [
            ActionModel(title: "Hi", time: 120),
            ActionModel(title: "Hello", time: 150),
            ActionModel(title: "Hey there", time: 100)
        ]
        actions.append(contentsOf: newActions)
    }
    
    func deleteAction(indexSet: IndexSet) {
        actions.remove(atOffsets: indexSet)
    }
    
    func moveAction(from: IndexSet, to: Int) {
        actions.move(fromOffsets: from, toOffset: to)
    }
    
    func addAction(title: String, time: Int) {
        let newAction = ActionModel(title: title, time: time)
        actions.append(newAction)
    }
}

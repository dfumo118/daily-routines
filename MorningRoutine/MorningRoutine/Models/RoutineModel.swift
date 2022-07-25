//
//  RoutineModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

struct RoutineModel : Identifiable, Codable, Equatable {
    let id: String
    var name: String
    var color: [Double] = [1, 0, 0]
    var time: Int = 0
    var actions : [ActionModel]
    
    init(name: String, actions: [ActionModel]) {
        self.id = UUID().uuidString
        self.name = name
        self.actions = actions
        self.time = actions.map({$0.time}).reduce(0, +)
    }
    
    init(name: String, actions: [ActionModel], color: [Double]) {
        self.id = UUID().uuidString
        self.name = name
        self.actions = actions
        self.time = actions.map({$0.time}).reduce(0, +)
        self.color = color
    }
    
    func timeAsString() -> String {
        let minutes = time / 60
        let seconds = time % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    func timeAsSentence() -> String {
        let minutes = time / 60
        let seconds = time % 60
        
        return String(format: "%d min %02d sec", minutes, seconds)
    }
}

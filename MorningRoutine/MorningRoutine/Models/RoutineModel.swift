//
//  RoutineModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

struct RoutineModel : Identifiable, Codable {
    let id: String = UUID().uuidString
    let name: String
    var time: Int = 0
    var actions : [ActionModel]
    
    func timeAsString() -> String {
        let minutes = time / 60
        let seconds = time % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}

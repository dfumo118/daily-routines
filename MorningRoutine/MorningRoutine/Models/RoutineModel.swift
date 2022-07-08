//
//  RoutineModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

class RoutineModel : ActionModel {
    let actions : [ActionModel]
    
    override init(title: String, time: Int) {
        self.actions = []
        super.init(title: title, time: time)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

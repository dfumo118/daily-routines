//
//  RoutineModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/7/22.
//

import Foundation

class RoutineModel : ItemModel {
    let actions : [ItemModel]
    
    init() {
        actions = []
    }
    
    required init(from decoder: Decoder) throws {
        super.init(from: decoder)
    }
}

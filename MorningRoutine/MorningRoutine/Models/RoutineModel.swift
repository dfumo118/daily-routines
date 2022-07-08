//
//  RoutineModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

struct RoutineModel : Identifiable, Codable {
    let id : String = UUID().uuidString
    let title : String
    let time : Int = 0
    let actions : [ItemModel] = []
}

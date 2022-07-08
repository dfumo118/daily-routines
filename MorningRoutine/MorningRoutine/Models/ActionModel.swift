//
//  ItemModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/6/22.
//

import Foundation

struct ActionModel : Identifiable, Codable {
    let id : String = UUID().uuidString
    let title: String
    let time: Int // time in seconds
    
    func timeAsString() -> String {
        let minutes = time / 60
        let seconds = time % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}

enum Item : String {
    case routine = "routine"
    case actn = "action"
}

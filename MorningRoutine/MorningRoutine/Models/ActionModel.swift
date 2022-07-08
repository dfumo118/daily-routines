//
//  ItemModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/6/22.
//

import Foundation

class ActionModel : Identifiable, Codable {
    let id : String
    let title : String
    let time : Int
    
    init(title: String, time: Int) {
        self.title = title
        self.time = time
        self.id = UUID().uuidString
    }
    
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

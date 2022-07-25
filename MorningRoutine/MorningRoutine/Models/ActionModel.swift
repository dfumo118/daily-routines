//
//  ItemModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/6/22.
//

import Foundation

struct ActionModel : Identifiable, Codable, Equatable {
    let id : String = UUID().uuidString
    var title : String
    var time : Int
    
    func timeAsString() -> String {
        let minutes = time / 60
        let seconds = time % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}

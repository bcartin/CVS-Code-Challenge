//
//  DetailViewModel.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI

@Observable
class DetailViewModel {
    
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var origin: String? {
        return character.origin?.name
    }
    
    var type: String? {
        if let type = character.type, !type.isEmpty {
            return type
        }
        else {
            return nil
        }
    }
    
    var formattedDate: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFractionalSeconds]
        let formattedDate = formatter.date(from: character.created ?? "")
        
        return formattedDate?.formatted(date: .abbreviated, time: .omitted) ?? "Not available"
    }
    
}

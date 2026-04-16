//
//  Character.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let gender: String?
    let image: String?
    let origin: Origin?
    let type: String?
    let created: String?
}

extension Character: Equatable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Origin: Codable {
    
    let name: String
    let url: String
}

//
//  Untitled.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    
    case invalidUrl
    case invalidResponse
    case noResults
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL was invalid, please try again later."
        case .invalidResponse:
            return "Invalid Response. Please try again later."
        case .noResults:
            return "There are no results, try a different search."
        case .serverError:
            return "There was an error with the server. Please try again alter"
        case .invalidData:
            return "The data is invalid. Please try again later."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}

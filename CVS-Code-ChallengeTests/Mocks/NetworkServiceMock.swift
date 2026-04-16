//
//  NetworkServiceMock.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import Foundation

class NetworkServiceMock: NetworkServiceProtocol {
    
    func fetchResults(from urlString: String) async throws -> Response {
        return mockResults
    }
    
    func performSearch(for searchText: String) async throws -> Response {
        return mockResults
    }
    
    let mockResults: Response = .init(info: Info(count: 107,
                                                 pages: 6,
                                                 next: "https://rickandmortyapi.com/api/character/?page=2&name=rick",
                                                 prev: nil),
                                      results: [
                                        Character(id: 1,
                                                  name: "Rick Sanchez",
                                                  status: nil,
                                                  species: "Human",
                                                  gender: nil,
                                                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                                        Character(id: 8,
                                                  name: "Adjudicator Rick",
                                                  status: nil,
                                                  species: "Human",
                                                  gender: nil,
                                                  image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg"),
                                      ])
    
}

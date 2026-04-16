//
//  NetworkService.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func fetchResults(from urlString: String) async throws -> Response
    func performSearch(for searchText: String) async throws -> Response
}

class NetworkService: NetworkServiceProtocol {
    
    //MARK: Putting this here for simplicity and speed, normally I would put it in a config file
    let BASE_URL = "https://rickandmortyapi.com/api/character/?name="

    //MARK: Simple network request since there's no need to create a custom request with custom headers, body, parameters or a method different than a GET
    func fetchResults(from urlString: String) async throws -> Response {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidUrl }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        print(httpResponse.statusCode)
        
        switch httpResponse.statusCode {
        case 200:
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                throw NetworkError.invalidData
            }
            return response
        case 404:
            throw NetworkError.noResults
        default:
            throw NetworkError.serverError
        }
    }
    
    func performSearch(for searchText: String) async throws -> Response {
        let urlString = "\(BASE_URL)\(searchText)"
        return try await fetchResults(from: urlString)
    }
}

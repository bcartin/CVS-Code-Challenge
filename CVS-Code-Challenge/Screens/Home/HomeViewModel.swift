//
//  HomeViewModel.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI
import Combine

@Observable @MainActor
final class HomeViewModel {
    
    @ObservationIgnored
    @Published var searchText: String = ""
    private var searchCancellable: AnyCancellable?
    
    let networkService: any NetworkServiceProtocol
    var results: [Character] = .init()
    var response: Response?
    var error: NetworkError?
    
    var showError: Bool = false
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        
        searchCancellable = $searchText
            .receive(on: DispatchQueue.main)
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] fragment in
                if !fragment.isEmpty {
                    self?.performSearch(searchText: fragment)
                }
                else {
                    self?.results.removeAll()
                }
            })
        
        
    }
    
    private func performSearch(searchText: String) {
        Task {
            do {
                self.results.removeAll()
                self.response = try await networkService.performSearch(for: searchText)
                self.results = self.response?.results ?? []
            }
            catch {
                self.error = error as? NetworkError
                self.showError = true
            }
        }
    }
    
    func fetchMoreResults() {
        if let urlString = response?.info.next {
            Task {
                do {
                    let newResponse = try await networkService.fetchResults(from: urlString)
                    self.response = newResponse
                    self.results.append(contentsOf: newResponse.results)
                }
                catch {
                    self.error = error as? NetworkError
                    self.showError = true
                }
            }
        }
    }
    
}

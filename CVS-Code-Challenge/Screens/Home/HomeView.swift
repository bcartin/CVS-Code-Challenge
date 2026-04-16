//
//  HomeView.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.results.isEmpty {
                    NoResultsView()
                }
                else {
                    List(viewModel.results) { character in
                        NavigationLink {
                            DetailView(viewModel: DetailViewModel(character: character))
                        } label: {
                            CharacterRowView(character: character)
                                .onAppear {
                                    if character == viewModel.results.last {
                                        viewModel.fetchMoreResults()
                                    }
                                }
                        }
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGroupedBackground))
            .alert(isPresented: $viewModel.showError, error: viewModel.error) { 
                Button("OK", role: .cancel, action: {})
            }
            
        }.searchable(text: $viewModel.searchText, prompt: "Search for a character")
        
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(networkService: NetworkService()))
}

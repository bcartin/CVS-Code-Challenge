//
//  DetailView.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI

struct DetailView: View {
    
    @State private var isLoading = true
    @State var viewModel: DetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.character.name)
                    .font(.title)
                
                AsyncImage(url: URL(string: viewModel.character.image ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                isLoading = false
                            }
                    case .failure(_):
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.secondary)
                            .onAppear {
                                isLoading = false
                            }
                    case .empty:
                        Rectangle()
                            .fill(.secondary.opacity(0.3))
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    @unknown default:
                        EmptyView()
                    }
                }
                .redacted(reason: isLoading ? .placeholder : [])
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Species: \(viewModel.character.species ?? "Unknown Species")")
                    
                    Text("Status: \(viewModel.character.status ?? "Unknown Status")")
                    
                    Text("Origin: \(viewModel.origin ?? "Unknown Origin")")
                    
                    if let type = viewModel.type {
                        Text("Type: \(viewModel.type ?? "Unknown Type")")
                    }
                    
                    Text("Created: \(viewModel.formattedDate)")
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
    }
}

#Preview {
    let testCharacter = Character(id: 1,
                                  name: "Rick Sanchez",
                                  status: "Alive",
                                  species: "Human",
                                  gender: "Male",
                                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                  origin: Origin(name: "unknown", url: ""),
                                  type: "", created: "2017-11-30T11:48:18.950Z")
    
    DetailView(viewModel: DetailViewModel(character: testCharacter))
}

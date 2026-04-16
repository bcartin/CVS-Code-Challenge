//
//  CharacterRowView.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI

struct CharacterRowView: View {
    
    @State private var isLoading = true
    var character: Character
    
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            
            AsyncImage(url: URL(string: character.image ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .onAppear {
                            isLoading = false
                        }
                case .failure(_):
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.secondary)
                        .onAppear {
                            isLoading = false
                        }
                case .empty:
                    Rectangle()
                        .fill(.secondary.opacity(0.3))
                        .frame(width: 90, height: 90)
                @unknown default:
                    EmptyView()
                }
            }
            .redacted(reason: isLoading ? .placeholder : [])
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 12) {
                Text(character.name)
                    .font(.title2)
                    .foregroundStyle(.primary)
                
                Text(character.species ?? "Unknown Species")
                    .foregroundStyle(.secondary)
                
            }
        }
        .padding()
    }
}

#Preview {
    
    let testCharacter = Character(id: 1,
                                  name: "Rick Sanchez",
                                  status: "Alive",
                                  species: "Human",
                                  gender: "Male",
                                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                  origin: nil,
                                  type: nil, created: "2017-11-30T11:48:18.950Z")
    
    CharacterRowView(character: testCharacter)
}

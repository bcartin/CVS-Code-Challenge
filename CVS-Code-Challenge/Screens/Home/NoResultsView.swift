//
//  NoResultsView.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 48, weight: .bold))
                .foregroundStyle(.placeholder)
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.placeholder.opacity(0.3))
                )
            
            Text("There are no results")
                .foregroundStyle(.placeholder)
                .font(.system(size: 32, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            Text("Try a different search")
                .font(.system(size: 20))
                .foregroundStyle(.placeholder)
        }
    }
}

#Preview {
    NoResultsView()
}

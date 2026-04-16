//
//  CVS_Code_ChallengeApp.swift
//  CVS-Code-Challenge
//
//  Created by Bernie Cartin on 4/16/26.
//

import SwiftUI

@main
struct CVS_Code_ChallengeApp: App {
    
    @State private var networkService = NetworkService()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(networkService: networkService))
        }
    }
}

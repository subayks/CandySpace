//
//  CandySpaceApp.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import SwiftUI

@main
struct CandySpaceApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeViewModel(
                    apiClient: APIClient()
                )
            )
        }
    }
}

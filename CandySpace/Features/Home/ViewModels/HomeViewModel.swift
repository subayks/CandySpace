//
//  HomeViewModel.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    @Published private(set) var isLoading = false
    @Published var errorMessage: String?
    @Published var sections: [CandySpaceSection] = []
    
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchRails() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            sections = try await apiClient.fetchCandySpaceContent()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

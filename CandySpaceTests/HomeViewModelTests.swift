//
//  HomeViewModelTests.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import XCTest
@testable import CandySpace

final class MockAPIClient: APIClientProtocol {
    func fetchCandySpaceContent() async throws -> [CandySpace.CandySpaceSection] {
        return [
            CandySpaceSection(
                id: "1",
                name: "Featured",
                type: "rail",
                items: [],
                collection: nil
            )
        ]
    }
}

@MainActor
final class HomeViewModelTests: XCTestCase {

    func testFetchRailsUpdatesUIState() async {

        let vm = HomeViewModel(apiClient: MockAPIClient())

        await vm.fetchRails()

        XCTAssertEqual(vm.sections.count, 1)
    }
}

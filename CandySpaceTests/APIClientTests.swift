//
//  APIClientTests.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import XCTest
@testable import CandySpace

final class APIClientTests: XCTestCase {

    func testFetchRailsReturnsData() async throws {

        let client = APIClient()

        let sections = try await client.fetchCandySpaceContent()

        XCTAssertFalse(sections.isEmpty)
    }
}

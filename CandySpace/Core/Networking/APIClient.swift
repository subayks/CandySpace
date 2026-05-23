//
//  APIClient.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import Foundation

protocol APIClientProtocol {
    func fetchCandySpaceContent() async throws -> [CandySpaceSection]
}

final class APIClient: APIClientProtocol {

    func fetchCandySpaceContent() async throws -> [CandySpaceSection] {

        guard let url = URL(string: Endpoint.home) else {
            throw APIError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  200...299 ~= httpResponse.statusCode else {
                throw APIError.invalidResponse
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let result = try decoder.decode(CandySpaceResponse.self, from: data)

            return result.record.sections ?? []

        } catch let decodingError as DecodingError {
            print(decodingError)
            throw APIError.decodingFailed
        } catch {
            throw APIError.network(error)
        }
    }
}

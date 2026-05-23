//
//  APIError.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case network(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return ApiConstants.invalidUrl
        case .invalidResponse:
            return ApiConstants.serverError
        case .decodingFailed:
            return ApiConstants.dataError
        case .network(let error):
            return error.localizedDescription
        }
    }
}

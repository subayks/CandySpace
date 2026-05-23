//
//  CandySpaceItem.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import Foundation

struct CandySpaceItem: Codable, Identifiable {
    let id: String?
    let type: String?
    let title: String?
    let subtitle: String?
    let strapline: String?
    let imageUrl: String?
    let badges: [String]?
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case title
        case subtitle
        case strapline
        case imageUrl
        case badges
    }
}

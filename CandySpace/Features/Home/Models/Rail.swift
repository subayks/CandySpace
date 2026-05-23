//
//  Rail.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import Foundation

import Foundation

struct CandySpaceSection: Codable, Identifiable {

    let id: String?
    let name: String?
    let type: String?
    let items: [CandySpaceItem]?
    let collection: CandySpaceCollection?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case items
        case collection
    }
}


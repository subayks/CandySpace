//
//  ImageCache.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import UIKit

final class ImageCache {

    static let shared = NSCache<NSString, UIImage>()

    private init() {}
}

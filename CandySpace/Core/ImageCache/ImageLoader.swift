//
//  ImageLoader.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import SwiftUI

@MainActor
final class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    func load(from urlString: String?) async {

        guard let urlString,
              let url = URL(string: urlString) else {
            return
        }

        if let cached = ImageCache.shared.object(forKey: urlString as NSString) {
            self.image = cached
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            guard let uiImage = UIImage(data: data) else {
                return
            }

            ImageCache.shared.setObject(uiImage, forKey: urlString as NSString)
            self.image = uiImage

        } catch {
            print(error)
        }
    }
}

//
//  CandySpaceItemView.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import SwiftUI

struct CandySpaceItemView: View {

    let item: CandySpaceItem
    let isPortrait: Bool

    private var cardWidth: CGFloat {
        isPortrait ? UIConstants.portraitWidth : UIConstants.landscapeWidth
    }

    private var cardHeight: CGFloat {
        isPortrait ? UIConstants.portraitHeight : UIConstants.landscapeHeight
    }

    var body: some View {

        VStack(alignment: .leading) {

            CachedAsyncImage(urlString: item.imageUrl)
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cardCornerRadius))
                .overlay(alignment: .bottom) {
                    if let badge = item.badges?.first {
                            Text(badge.uppercased())
                                .font(.caption2.bold())
                                .padding(.horizontal, UIConstants.padding8)
                                .padding(.vertical, UIConstants.padding4)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                                .padding(.bottom, UIConstants.padding8)
                        }
                    }
            Text(item.title ?? "")
                .font(.headline)
        }
        .frame(width: cardWidth)
    }
}

struct CachedAsyncImage: View {

    let urlString: String?

    @StateObject private var loader = ImageLoader()

    var body: some View {

        Group {
            if let image = loader.image {

                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()

            } else {

                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))

                    ProgressView()
                }
            }
        }
        .task {
            await loader.load(from: urlString)
        }
    }
}

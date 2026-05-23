//
//  CandySpaceSectionView.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import SwiftUI

struct CandySpaceSectionView: View {

    let section: CandySpaceSection

    private var isPortrait: Bool {
        section.collection?.imageAspectRatio == "2x3"
    }

    var body: some View {

        VStack(alignment: .leading, spacing: UIConstants.railSpacing) {

            Text(section.name ?? AppConstants.defaultTitle)
                .font(.title3.bold())
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {

                LazyHStack(spacing: UIConstants.railSpacing) {

                    ForEach(section.items ?? []) { item in
                        CandySpaceItemView(
                            item: item,
                            isPortrait: isPortrait
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

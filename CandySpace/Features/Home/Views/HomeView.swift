//
//  HomeView.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel

    var body: some View {

        NavigationStack {

            Group {

                if viewModel.isLoading {
                    LoadingView()

                } else if let error = viewModel.errorMessage {

                    ErrorView(
                        message: error,
                        retryAction: {
                            Task {
                                await viewModel.fetchRails()
                            }
                        }
                    )

                } else {

                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: UIConstants.railSpacing24) {

                            ForEach(viewModel.sections) { section in
                                CandySpaceSectionView(section: section)
                            }
                        }
                        .padding(.vertical)
                    }
                    .refreshable {
                        await viewModel.fetchRails()
                    }
                }
            }
            .navigationTitle(AppConstants.home)
        }
        .task {
            await viewModel.fetchRails()
        }
    }
}

//
//  LoadingView.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//
import SwiftUI

struct LoadingView: View {

    var body: some View {

        VStack(spacing: 16) {
            ProgressView()
            Text(AppConstants.loading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

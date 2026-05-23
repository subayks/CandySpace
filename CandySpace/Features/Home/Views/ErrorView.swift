//
//  ErrorView.swift
//  CandySpace
//
//  Created by Subaykala on 23/05/26.
//

import SwiftUI

struct ErrorView: View {

    let message: String
    let retryAction: () -> Void

    var body: some View {

        VStack(spacing: 16) {

            Text(message)
                .multilineTextAlignment(.center)

            Button(AppConstants.retry) {
                retryAction()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

//
//  LanguageSelectionView.swift
//  Mafateeh
//
//  Created by Arafat on 17/12/2024.
//

import SwiftUI

struct LanguageSelectionView: View {
    var body: some View {
        VStack {
            // Progress Indicator
            HStack(spacing: 10) {
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 60, height: 6)
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 60, height: 6)
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 60, height: 6)
            }
            .padding(.top, 30)

            Spacer()

            // Content in ScrollView for better adaptability
            ScrollView {
                VStack(spacing: 40) {
                    // Title
                    Text("🌐 Select Language")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 10)

                    // Language Selection Buttons
                    HStack(spacing: 20) {
                        Button(action: {
                            print("AR Selected")
                        }) {
                            Text("AR")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 140, height: 140)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.blue]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .cornerRadius(20)
                        }

                        Button(action: {
                            print("EN Selected")
                        }) {
                            Text("EN")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 140, height: 140)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.blue]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.vertical, 30)
            }

            Spacer()

            // "Next" Button at the bottom
            Button(action: {
                print("Next Tapped")
            }) {
                Text("Next")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 30)
        }
        .background(Color(UIColor.systemGray6)) // Light background color
    }
}

#Preview {
    LanguageSelectionView()
}

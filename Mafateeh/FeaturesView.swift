//
//  SwiftUIView.swift
//  Mafateeh
//
//  Created by Arafat on 17/12/2024.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        VStack {
            // Progress Indicator
            HStack(spacing: 10) {
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 100, height: 7)
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 100, height: 7)
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 100, height: 7)
            }
            .padding(.top, 30)
            
            Spacer(minLength: 35)

            // Scrollable Content
            ScrollView {
                VStack(spacing: 30) {
                    // Feature Card
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 530)
                        .overlay(
                            VStack(alignment: .leading, spacing: 50) {
                                FeatureRow(
                                    title: "Larger and Clearer than Ever",
                                    description: "A bigger, easier-to-read keyboard for better clarity",
                                    icon: "🖥️"
                                )
                                FeatureRow(
                                    title: "Use your Voice",
                                    description: "Hands-free typing with voice recognition",
                                    icon: "🗣️"
                                )
                                FeatureRow(
                                    title: "Predictive and Convenient",
                                    description: "Smart suggestions to speed up typing",
                                    icon: "💡"
                                )
                                FeatureRow(
                                    title: "Quick Phrases",
                                    description: "Saved favorite phrases for effortless access and faster typing",
                                    icon: "✍️"
                                )
                            }
                            .padding(40)
                        )
                }
                .padding(.vertical, 10)
            }
            
            Spacer()

            // Buttons at the bottom
            VStack(spacing: 15) {
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

                Button(action: {
                    print("Skip Tapped")
                }) {
                    Text("Skip")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 30)
        }
        .background(Color(UIColor.systemGray6)) // Light background color
    }
}

// Feature Row View
struct FeatureRow: View {
    var title: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(icon)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    FeaturesView()
}

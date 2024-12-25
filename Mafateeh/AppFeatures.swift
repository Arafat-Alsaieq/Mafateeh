//
//  AppFeatures.swift
//  Mafateeh
//
//  Created by shatha alsawilam on 24/06/1446 AH.
//

import SwiftUI

struct AppFeatures_Home: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer(minLength: 0)

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
                Spacer(minLength: 0)
            }
            .padding(.top, -50)
        }
    }
}

struct FeatureRowl: View {
    var title: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            Text(icon)
                .font(.system(size: 50))
                .offset(y: 30)
                .rotationEffect(.degrees(15))
        }
    }
}

struct AppFeatures_Home_Previews: PreviewProvider {
    static var previews: some View {
        AppFeatures_Home()
    }
}

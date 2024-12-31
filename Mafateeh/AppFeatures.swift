//
//  AppFeatures.swift
//  Mafateeh
//
//  Created by shatha alsawilam on 24/06/1446 AH.
//
import SwiftUI

struct AppFeatures: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer(minLength: 0)

                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.3), radius: 20, x: 0, y: 15)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 600)
                    .overlay(
                        VStack(alignment: .leading, spacing: 50) {
                            FeatureRow(
                                title: NSLocalizedString("Larger and Clearer than Ever", comment: "Feature title: Larger and clearer keyboard"),
                                description: NSLocalizedString("A bigger, easier-to-read keyboard for better clarity", comment: "Description for the feature of a larger keyboard"),
                                icon: "🖥️"
                            )
                            FeatureRow(
                                title: NSLocalizedString("Use your Voice", comment: "Feature title: Voice typing"),
                                description: NSLocalizedString("Hands-free typing with voice recognition", comment: "Description for voice recognition feature"),
                                icon: "🗣️"
                            )
                            FeatureRow(
                                title: NSLocalizedString("Predictive and Convenient", comment: "Feature title: Predictive text"),
                                description: NSLocalizedString("Smart suggestions to speed up typing", comment: "Description for predictive typing feature"),
                                icon: "💡"
                            )
                            FeatureRow(
                                title: NSLocalizedString("Quick Phrases", comment: "Feature title: Quick phrases"),
                                description: NSLocalizedString("Saved favorite phrases for effortless access and faster typing", comment: "Description for saved quick phrases feature"),
                                icon: "✍️"
                            )
                        }
                        .padding(40)
                    )
                    .padding(.top, 10) // تم تخفيض المسافة لتقريب المربع
                Spacer(minLength: 0)
            }
        }
    }
}

struct FeatureRowl: View {
    var title: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                   .font(.system(size: 40))
                    .fontWeight(.bold)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(description)
                   .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            Text(icon)
                .font(.system(size: 120))
                .offset(y: 20)
                .rotationEffect(.degrees(15))
        }
    }
}

struct AppFeatures_Previews: PreviewProvider {
    static var previews: some View {
        AppFeatures()
    }
}

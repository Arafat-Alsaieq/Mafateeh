//
//  OnboardingView.swift
//  Mafateeh
//
//  Created by Arafat on 17/12/2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            LanguageSelectionView()  // Screen 1
            FeaturesView()           // Screen 2
            FinalTutorialView()      // Screen 3
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Swipeable pages with dots
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}

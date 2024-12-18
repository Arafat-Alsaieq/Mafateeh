//
//  FinalTutorialView.swift
//  Mafateeh
//
//  Created by Arafat on 17/12/2024.
//

import SwiftUI

struct FinalTutorialView: View {
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            // Placeholder for image
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 300, height: 300)
            
            VStack(spacing: 20) {
                Button(action: {}) {
                    Text("Get Started")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                
                Button(action: {}) {
                    Text("Skip")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FinalTutorialView()
}

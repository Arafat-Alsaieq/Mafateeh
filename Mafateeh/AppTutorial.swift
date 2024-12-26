//
//  AppTutorial.swift
//  Mafateeh
//
//  Created by Arafat on 25/12/2024.
//
import SwiftUI

struct AppTutorial: View {
    var body: some View {
        VStack {
            Spacer()

            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray.opacity(0.4))
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(width: UIScreen.main.bounds.width - 40, height: 650)
                .padding(.bottom, 20)

            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    AppTutorial()
}

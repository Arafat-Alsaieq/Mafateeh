//
//  ContentView.swift
//  Mafateeh
//
//  Created by Arafat on 15/12/2024.
//

import SwiftUI

struct AnimatedTextScreen: View {
    @State private var showLetters = Array(repeating: false, count: 7)
    @State private var pressed = Array(repeating: false, count: 7)
    
    let letters = Array("حيتافم")
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.8)]), center: .center, startRadius: 0, endRadius: 600)
                .ignoresSafeArea()
                .blur(radius: 8)
            
            HStack(spacing: 10) {
                ForEach(0..<letters.count, id: \.self) { index in
                    VStack {
                        if showLetters[index] {
                            Text(String(letters[index]))
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(12)
                                .shadow(color: Color.blue.opacity(0.6), radius: 8, x: 4, y: 4)
                                .rotation3DEffect(.degrees(pressed[index] ? 0 : -10), axis: (x: 1, y: 0, z: 0))
                                .scaleEffect(pressed[index] ? 0.9 : 1.0)
                                .animation(Animation.easeInOut(duration: 0.8).delay(Double(index) * 0.2), value: showLetters[index])
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .onAppear {
            for index in 0..<letters.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
                    withAnimation {
                        showLetters[index] = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 + Double(index) * 0.2) {
                        withAnimation { pressed[index] = true }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + Double(index) * 0.2) {
                        withAnimation { pressed[index] = false }
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        AnimatedTextScreen()
    }
}

#Preview {
    ContentView()
}

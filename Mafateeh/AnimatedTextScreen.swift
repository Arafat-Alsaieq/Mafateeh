import SwiftUI

struct AnimatedTextScreen: View {
    @State private var showLetters = Array(repeating: false, count: 7)
    @State private var pressed = Array(repeating: false, count: 7)
    @State private var navigateToFeaturesView = false
    
    let letters = Array("مفاتيح")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    HStack(spacing: 12) {
                        ForEach(0..<letters.count, id: \.self) { index in
                            VStack {
                                if showLetters[index] {
                                    Text(String(letters[index]))
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: 50, height: 50)
                                        .background(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .fill(Color.blue)
                                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 2, y: 2)
                                                    .shadow(color: pressed[index] ? Color.blue.opacity(0.3) : Color.clear, radius: 10, x: 0, y: 4)
                                            }
                                        )
                                        .cornerRadius(12)
                                        .scaleEffect(pressed[index] ? 0.95 : 1.0)
                                        .animation(Animation.easeInOut(duration: 0.3), value: pressed[index])
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .environment(\.layoutDirection, .rightToLeft)
                    
                    Text("Mafateeh")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                }
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
                
                // بعد 4 ثواني، الانتقال إلى FeaturesView
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation {
                        navigateToFeaturesView = true
                    }
                }
            }
            
            // الانتقال إلى FeaturesView بعد 4 ثواني
            NavigationLink(
                destination: FeaturesView().navigationBarBackButtonHidden(true), // إخفاء زر الرجوع
                isActive: $navigateToFeaturesView,
                label: { EmptyView() }
            )
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

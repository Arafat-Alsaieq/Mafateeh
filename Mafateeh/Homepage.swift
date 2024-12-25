import SwiftUI

struct Homepage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color("BG")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Big Keys,                Boundless Ease")
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .padding(.top, 30)
                        .padding(.leading, 40)
                    
                    VStack(spacing: -50) { // Adds consistent spacing between buttons
                        NavigationLink(destination: AppFeatures()){
                            CustomButton(text: "App Features", emoji: "🌟")
                        }
                        NavigationLink(destination: AppTutorial()) {
                            CustomButton(text: "Tutorial", emoji: "🎞️")
                        }
                        NavigationLink(destination: MyClipboard()) {
                            CustomButton(text: "My clipboard", emoji: "📋")
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

struct CustomButton: View {
    let text: String
    let emoji: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Button"))
                .frame(width: 330, height: 145)
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                startPoint: .bottom,
                endPoint: .leading
            )
            
            HStack {
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 60)
                    .padding(.bottom, 30)
                    .font(.system(size: 25))
                
                Spacer()
                
                if let emoji = emoji {
                    Text(emoji)
                        .font(.system(size: 50))
                        .padding(.trailing, 60)
                }
            }
        }
    }
}



#Preview {
    Homepage()
}

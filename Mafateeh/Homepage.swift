import SwiftUI

struct Homepage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BG")
                    .ignoresSafeArea()
                
                VStack {
                    Text(NSLocalizedString("Big Keys,  Boundless Ease", comment: "Main title on the homepage"))
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .padding(.top, 30)
                        .padding(.leading, 40)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()

                    VStack(spacing: -50) {
                        // زر App Features
                        NavigationLink(destination: AppFeatures()) {
                            CustomButton(text: NSLocalizedString("App Features", comment: "Button text for app features"), emoji: "🌟")
                        }
                        
                        // زر Tutorial
                        NavigationLink(destination: AppTutorial()) {
                            CustomButton(text: NSLocalizedString("Tutorial", comment: "Button text for tutorial"), emoji: "🎞️")
                        }
                        
                        // زر My Clipboard
                        NavigationLink(destination: MyClipboard()) {
                            CustomButton(text: NSLocalizedString("My clipboard", comment: "Button text for my clipboard"), emoji: "📋")
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
            .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع
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
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.leading, 60)
                    .padding(.bottom, 30)
                    .font(.system(size: 28))
                    .lineLimit(1)
                
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

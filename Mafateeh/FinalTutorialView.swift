import SwiftUI

struct FinalTutorialView: View {
    var body: some View {
    
            VStack {
                // Progress Indicator
                HStack(spacing: 10) {
                    Capsule()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 100, height: 7)
                    Capsule()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 100, height: 7)
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: 100, height: 7)
                }
                .padding(.top, 30)
                
                Spacer(minLength: 35)

                // Scrollable Content
                ScrollView {
                    VStack(spacing: 30) {
                        // Feature Card
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gray.opacity(0.4))
                            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 530)
                        
                                    
                                
                            
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

    
        
        
               


    
    
    #Preview {
        FinalTutorialView()
    
}

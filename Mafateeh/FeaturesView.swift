import SwiftUI

struct FeaturesView: View {
    @State private var progress: CGFloat = 0

    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 10) {
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 150, height: 7)

                        Capsule()
                            .fill(Color.blue)
                            .frame(width: progress * 150, height: 7)
                    }

                    Capsule()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 150, height: 7)
                }
                .padding(.top, 30)
                .onAppear {
                    withAnimation(.linear(duration: 0.5)) {
                        progress = 1
                    }
                }

                Spacer(minLength: 35)

                ScrollView {
                    VStack(spacing: 30) {
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
                    }
                    .padding(.vertical, 10)
                }

                Spacer()

                VStack(spacing: 15) {
                    NavigationLink(destination: FinalTutorialView().navigationBarBackButtonHidden(true)) {
                        Text("Next")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .padding(.horizontal, 20)
                    }

                    NavigationLink(destination: Homepage().navigationBarBackButtonHidden(true)) {
                        Text("Skip")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 30)
            }
            .background(Color(UIColor.systemGray6))
        }
    }
}

struct FeatureRow: View {
    var title: String
    var description: String
    var icon: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer()

            Text(icon)
                .font(.system(size: 40))
                .offset(y: 30)
                .rotationEffect(.degrees(15))
        }
    }
}



struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
    }
}

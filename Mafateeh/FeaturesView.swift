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
                                        title: NSLocalizedString("Larger and Clearer than Ever", comment: "Feature: Describes the size of the keyboard"),
                                        description: NSLocalizedString("A bigger, easier-to-read keyboard for better clarity", comment: "Description for larger keyboard feature"),
                                        icon: "🖥️"
                                    )
                                    FeatureRow(
                                        title: NSLocalizedString("Use your Voice", comment: "Feature: Voice typing option"),
                                        description: NSLocalizedString("Hands-free typing with voice recognition", comment: "Description for voice recognition feature"),
                                        icon: "🗣️"
                                    )
                                    FeatureRow(
                                        title: NSLocalizedString("Predictive and Convenient", comment: "Feature: Predictive text feature"),
                                        description: NSLocalizedString("Smart suggestions to speed up typing", comment: "Description for predictive typing feature"),
                                        icon: "💡"
                                    )
                                    FeatureRow(
                                        title: NSLocalizedString("Quick Phrases", comment: "Feature: Quick access to saved phrases"),
                                        description: NSLocalizedString("Saved favorite phrases for effortless access and faster typing", comment: "Description for saved phrases feature"),
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
                        Text(NSLocalizedString("Next", comment: "Button text to proceed to next screen"))
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .padding(.horizontal, 20)
                        
                    }

                    NavigationLink(destination: Homepage().navigationBarBackButtonHidden(true)) {
                        Text(NSLocalizedString("Skip", comment: "Button text to skip tutorial"))
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

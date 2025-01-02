import SwiftUI
import AVKit

struct MainContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false

    var body: some View {
        NavigationStack {
            if hasSeenOnboarding {
                Homepage() // الانتقال إلى الصفحة الرئيسية مباشرة
            } else {
                FeaturesView() // عرض صفحات Onboarding
            }
        }
    }
}

struct FeaturesView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @State private var navigateToHomepage: Bool = false // حالة للتنقل إلى الصفحة الرئيسية
    @State private var progress: CGFloat = 0

    var body: some View {
        NavigationStack {
            VStack {
                // محتوى Onboarding هنا
                HStack(spacing: 10) {
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 150, height: 7)

                        Capsule()
                            
                            .fill(Color(red: 62/255, green: 81/255, blue: 255/255)) // لون #3E51FF)
                            .frame(width: progress * 150, height: 7)
                    }

                    Capsule()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 150, height: 7)
                }
                .padding(.top, 30)
                .onAppear {
                    // تحديث progress عند ظهور الصفحة
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
                            .frame(width: UIScreen.main.bounds.width - 40, height: 500)
                            .overlay(
                                VStack(alignment: .leading, spacing: 40) {
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
                    NavigationLink(destination: FFinalTutorialView().navigationBarBackButtonHidden(true)) {
                        Text("Next")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color(red: 62/255, green: 81/255, blue: 255/255)) // لون #3E51FF
                            .cornerRadius(25)
                            .padding(.horizontal, 20)
                    }

                    Button(action: {
                        hasSeenOnboarding = true // تحديث الحالة
                        navigateToHomepage = true
                    }) {
                        Text("Skip")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .background(
                        NavigationLink(
                            destination: Homepage().navigationBarBackButtonHidden(true),
                            isActive: $navigateToHomepage
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    )
                }
                .padding(.bottom, 30)
            }
            .background(Color(UIColor.systemGray6))
            .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع
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
struct FFinalTutorialView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @State private var navigateToHomepage: Bool = false // تعريف المتغير هنا

    private var player: AVPlayer {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Vid1", ofType: "mp4")!))
        player.actionAtItemEnd = .none // استمرار الفيديو عند النهاية
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero) // إعادة تشغيل الفيديو من البداية
            player.play()
        }
        player.play() // تشغيل الفيديو تلقائيًا
        return player
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 10) {
                    Capsule()
                        .fill(Color(red: 62/255, green: 81/255, blue: 255/255))
                        .frame(width: 150, height: 7)
                    
                    Capsule()
                        .fill(Color(red: 62/255, green: 81/255, blue: 255/255)) // لون #3E51FF)
                        .frame(width: 150, height: 7)
                }
                .padding(.top, 30)
                
                Spacer(minLength: 35)

               
                    VStack(spacing: 30) {
                        // إزالة الخلفية السوداء من المستطيل
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.clear) // جعل الخلفية شفافة
                            .frame(width: UIScreen.main.bounds.width - 30, height: 550)
                            .overlay(
                                VideoPlayer(player: player)
                                    .cornerRadius(30) // لإعطاء الزوايا نفس الشكل
                                    .clipped() // لمنع تجاوز الفيديو للحواف
                            )
                    }
                    .padding(.vertical, 10)
                

                Spacer()
                    .background(Color.white)
                    .ignoresSafeArea()

                VStack(spacing: 15) {
                    // تعديل زر Add Keyboard لفتح إعدادات التطبيق
                    Button(action: {
                        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                            if UIApplication.shared.canOpenURL(settingsURL) {
                                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                            }
                        }
                    }) {
                        Text("Add Keyboard")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color(red: 62/255, green: 81/255, blue: 255/255)) // لون #3E51FF
                            .cornerRadius(25)
                            .padding(.horizontal, 20)
                    }

                    Button(action: {
                        hasSeenOnboarding = true // تحديث الحالة
                        navigateToHomepage = true
                    }) {
                        Text("Go Home")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .background(
                        NavigationLink(
                            destination: Homepage().navigationBarBackButtonHidden(true),
                            isActive: $navigateToHomepage
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    )
                }
                .padding(.bottom, 30)
            }
            .background(Color(UIColor.systemGray6))
        }
    }
}

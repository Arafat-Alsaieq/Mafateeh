//
//  AppTutorial.swift
//  Mafateeh
//
//  Created by Arafat on 25/12/2024.
//
import SwiftUI
import AVKit

struct AppTutorial: View {
    private var player: AVPlayer {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "tutorial", ofType: "mp4")!))
        player.actionAtItemEnd = .none // استمرار الفيديو عند النهاية
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero) // إعادة تشغيل الفيديو من البداية
            player.play()
        }
        player.play() // تشغيل الفيديو تلقائيًا
        return player
    }
    
    var body: some View {
        VStack {
            Spacer()

            // إزالة RoundedRectangle لعدم إضافة إطار خلف الفيديو
            VideoPlayer(player: player)
                .frame(width: UIScreen.main.bounds.width - 50, height: 630)
                .cornerRadius(30) // لإعطاء الفيديو زوايا مستديرة
                .clipped() // لمنع تجاوز الفيديو للحواف



            VStack(spacing: 15) {
                Button(action: {
                    // Open the app's system settings
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                        }
                    }
                }) {
                    Text("Go settings")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                }
            }
            .padding(.top, 10)
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    AppTutorial()
}

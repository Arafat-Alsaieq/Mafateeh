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

            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    AppTutorial()
}

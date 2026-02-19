import SwiftUI

struct MainMenuViewColdwaterGlimpse: View {
    let onPlayColdwaterGlimpse: () -> Void
    let onAchievementsColdwaterGlimpse: () -> Void
    let onSettingsColdwaterGlimpse: () -> Void

    @ObservedObject private var settingsColdwaterGlimpse = SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse
    @State private var logoBounceColdwaterGlimpse: CGFloat = 0
    @State private var appearedColdwaterGlimpse = false

    var body: some View {
        ZStack {
            BackgroundViewColdwaterGlimpse()

            snowOverlayColdwaterGlimpse

            VStack(spacing: 0) {
                Spacer()

                Image("LogoColdwaterGlimpse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .offset(y: logoBounceColdwaterGlimpse)
                    .shadow(color: ColorPaletteColdwaterGlimpse.skyBlueColdwaterGlimpse.opacity(0.5), radius: 20)

                Text("Coldwater Glimpse")
                    .font(.latoBlackColdwaterGlimpse(32))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 4, y: 2)
                    .padding(.top, 8)

                Spacer().frame(height: 30)

                recordPanelColdwaterGlimpse

                Spacer().frame(height: 36)

                buttonStackColdwaterGlimpse
                    .padding(.horizontal, 44)

                Spacer()
            }
            .opacity(appearedColdwaterGlimpse ? 1 : 0)
            .offset(y: appearedColdwaterGlimpse ? 0 : 30)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) { appearedColdwaterGlimpse = true }
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                logoBounceColdwaterGlimpse = -8
            }
        }
    }

    // MARK: - Subviews

    private var recordPanelColdwaterGlimpse: some View {
        FrostedPanelColdwaterGlimpse(builderColdwaterGlimpse: {
            VStack(spacing: 6) {
                Text("Best Score")
                    .font(.latoBlackColdwaterGlimpse(14))
                    .foregroundColor(ColorPaletteColdwaterGlimpse.frostBlueColdwaterGlimpse)
                Text("\(settingsColdwaterGlimpse.highScoreColdwaterGlimpse)")
                    .font(.latoBlackColdwaterGlimpse(42))
                    .foregroundColor(ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse)
            }
        })
        .padding(.horizontal, 60)
    }

    private var buttonStackColdwaterGlimpse: some View {
        VStack(spacing: 14) {
            IceButtonColdwaterGlimpse(
                titleColdwaterGlimpse: "Play",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
                actionColdwaterGlimpse: onPlayColdwaterGlimpse
            )
            IceButtonColdwaterGlimpse(
                titleColdwaterGlimpse: "Achievements",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.royalBlueColdwaterGlimpse,
                actionColdwaterGlimpse: onAchievementsColdwaterGlimpse
            )
            IceButtonColdwaterGlimpse(
                titleColdwaterGlimpse: "Settings",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.darkTealColdwaterGlimpse,
                actionColdwaterGlimpse: onSettingsColdwaterGlimpse
            )
        }
    }

    private var snowOverlayColdwaterGlimpse: some View {
        GeometryReader { geoColdwaterGlimpse in
            ForEach(0..<12, id: \.self) { iColdwaterGlimpse in
                SnowflakeParticleColdwaterGlimpse(
                    delayColdwaterGlimpse: Double(iColdwaterGlimpse) * 0.3,
                    sizeColdwaterGlimpse: CGFloat.random(in: 3...6)
                )
                .position(
                    x: CGFloat.random(in: 0...geoColdwaterGlimpse.size.width),
                    y: 0
                )
            }
        }
        .allowsHitTesting(false)
    }
}

#Preview {
    MainMenuViewColdwaterGlimpse(
        onPlayColdwaterGlimpse: {},
        onAchievementsColdwaterGlimpse: {},
        onSettingsColdwaterGlimpse: {}
    )
}

import SwiftUI
import Combine

enum AppScreenColdwaterGlimpse: Equatable {
    case splashColdwaterGlimpse
    case onboardingColdwaterGlimpse
    case menuColdwaterGlimpse
    case modeSelectionColdwaterGlimpse
    case gameplayColdwaterGlimpse
    case achievementsColdwaterGlimpse
}

struct ContentView: View {
    @State private var activeScreenColdwaterGlimpse: AppScreenColdwaterGlimpse = .splashColdwaterGlimpse
    @State private var chosenGameModeColdwaterGlimpse: GameModeColdwaterGlimpse = .compareColdwaterGlimpse
    @State private var showSettingsColdwaterGlimpse = false
    @State private var musicStartedColdwaterGlimpse = false

    private let audioColdwaterGlimpse = AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse
    private let settingsColdwaterGlimpse = SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse

    var body: some View {
        ZStack {
            screenLayerColdwaterGlimpse

            if showSettingsColdwaterGlimpse {
                Color.black.opacity(0.55)
                    .ignoresSafeArea()
                    .onTapGesture { }
                    .transition(.identity)
                    .zIndex(10)

                SettingsOverlayColdwaterGlimpse(onCloseColdwaterGlimpse: {
                    withAnimation(.easeInOut(duration: 0.3)) { showSettingsColdwaterGlimpse = false }
                })
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                .zIndex(10)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: activeScreenColdwaterGlimpse)
        .onChange(of: activeScreenColdwaterGlimpse) { newScreenColdwaterGlimpse in
            manageMusicForScreenColdwaterGlimpse(newScreenColdwaterGlimpse)
        }
    }

    // MARK: - Screen router

    @ViewBuilder
    private var screenLayerColdwaterGlimpse: some View {
        switch activeScreenColdwaterGlimpse {
        case .splashColdwaterGlimpse:
            SplashViewColdwaterGlimpse(onFinishedColdwaterGlimpse: {
                withAnimation {
                    activeScreenColdwaterGlimpse = settingsColdwaterGlimpse.onboardingDoneColdwaterGlimpse
                        ? .menuColdwaterGlimpse
                        : .onboardingColdwaterGlimpse
                }
            })
            .transition(.opacity)

        case .onboardingColdwaterGlimpse:
            OnboardingViewColdwaterGlimpse(onCompleteColdwaterGlimpse: {
                settingsColdwaterGlimpse.onboardingDoneColdwaterGlimpse = true
                withAnimation { activeScreenColdwaterGlimpse = .menuColdwaterGlimpse }
            })
            .transition(.opacity)

        case .menuColdwaterGlimpse:
            MainMenuViewColdwaterGlimpse(
                onPlayColdwaterGlimpse: {
                    withAnimation { activeScreenColdwaterGlimpse = .modeSelectionColdwaterGlimpse }
                },
                onAchievementsColdwaterGlimpse: {
                    withAnimation { activeScreenColdwaterGlimpse = .achievementsColdwaterGlimpse }
                },
                onSettingsColdwaterGlimpse: {
                    withAnimation(.easeInOut(duration: 0.3)) { showSettingsColdwaterGlimpse = true }
                }
            )
            .transition(.opacity)

        case .modeSelectionColdwaterGlimpse:
            ModeSelectionViewColdwaterGlimpse(
                onSelectModeColdwaterGlimpse: { modeColdwaterGlimpse in
                    chosenGameModeColdwaterGlimpse = modeColdwaterGlimpse
                    withAnimation { activeScreenColdwaterGlimpse = .gameplayColdwaterGlimpse }
                },
                onBackColdwaterGlimpse: {
                    withAnimation { activeScreenColdwaterGlimpse = .menuColdwaterGlimpse }
                }
            )
            .transition(.asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            ))

        case .gameplayColdwaterGlimpse:
            GameplayViewColdwaterGlimpse(
                chosenModeColdwaterGlimpse: chosenGameModeColdwaterGlimpse,
                onExitMenuColdwaterGlimpse: {
                    withAnimation { activeScreenColdwaterGlimpse = .menuColdwaterGlimpse }
                },
                onPlayAgainColdwaterGlimpse: {
                    withAnimation { activeScreenColdwaterGlimpse = .modeSelectionColdwaterGlimpse }
                }
            )
            .transition(.asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .opacity
            ))

        case .achievementsColdwaterGlimpse:
            AchievementsViewColdwaterGlimpse(onBackColdwaterGlimpse: {
                withAnimation { activeScreenColdwaterGlimpse = .menuColdwaterGlimpse }
            })
            .transition(.asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            ))
        }
    }

    // MARK: - Music

    private func manageMusicForScreenColdwaterGlimpse(_ screenColdwaterGlimpse: AppScreenColdwaterGlimpse) {
        switch screenColdwaterGlimpse {
        case .splashColdwaterGlimpse, .onboardingColdwaterGlimpse:
            audioColdwaterGlimpse.stopMusicColdwaterGlimpse()
            musicStartedColdwaterGlimpse = false
        case .menuColdwaterGlimpse, .modeSelectionColdwaterGlimpse, .gameplayColdwaterGlimpse, .achievementsColdwaterGlimpse:
            if !musicStartedColdwaterGlimpse {
                audioColdwaterGlimpse.startMusicColdwaterGlimpse()
                musicStartedColdwaterGlimpse = true
            }
        }
    }
}

#Preview {
    ContentView()
}

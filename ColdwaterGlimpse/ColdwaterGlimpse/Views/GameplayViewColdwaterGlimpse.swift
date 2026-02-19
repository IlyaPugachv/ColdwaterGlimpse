import SwiftUI
import Combine

struct GameplayViewColdwaterGlimpse: View {
    let chosenModeColdwaterGlimpse: GameModeColdwaterGlimpse
    let onExitMenuColdwaterGlimpse: () -> Void
    let onPlayAgainColdwaterGlimpse: () -> Void

    @StateObject private var engineColdwaterGlimpse = GameEngineColdwaterGlimpse()
    @State private var exactInputColdwaterGlimpse = ""

    var body: some View {
        ZStack {
            BackgroundViewColdwaterGlimpse()

            VStack(spacing: 0) {
                gameHeaderColdwaterGlimpse
                    .padding(.horizontal, 20)
                    .padding(.top, 12)

                if engineColdwaterGlimpse.phaseColdwaterGlimpse == .showingFieldColdwaterGlimpse {
                    TimerBarColdwaterGlimpse(progressColdwaterGlimpse: engineColdwaterGlimpse.timerProgressColdwaterGlimpse)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                }

                Spacer()

                mainContentColdwaterGlimpse

                Spacer()
            }

            if engineColdwaterGlimpse.phaseColdwaterGlimpse == .pausedColdwaterGlimpse {
                Color.black.opacity(0.55)
                    .ignoresSafeArea()
                    .onTapGesture { }
                    .transition(.identity)

                PauseOverlayColdwaterGlimpse(
                    onContinueColdwaterGlimpse: { engineColdwaterGlimpse.resumeFromPauseColdwaterGlimpse() },
                    onRestartColdwaterGlimpse: {
                        exactInputColdwaterGlimpse = ""
                        engineColdwaterGlimpse.launchNewSessionColdwaterGlimpse(modeColdwaterGlimpse: chosenModeColdwaterGlimpse)
                    },
                    onExitColdwaterGlimpse: onExitMenuColdwaterGlimpse
                )
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }

            if engineColdwaterGlimpse.phaseColdwaterGlimpse == .gameOverColdwaterGlimpse {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture { }
                    .transition(.identity)

                GameOverOverlayColdwaterGlimpse(
                    scoreColdwaterGlimpse: engineColdwaterGlimpse.finalScoreColdwaterGlimpse,
                    recordColdwaterGlimpse: SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse.highScoreColdwaterGlimpse,
                    onReplayColdwaterGlimpse: onPlayAgainColdwaterGlimpse,
                    onMenuColdwaterGlimpse: onExitMenuColdwaterGlimpse
                )
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
        .onAppear {
            engineColdwaterGlimpse.launchNewSessionColdwaterGlimpse(modeColdwaterGlimpse: chosenModeColdwaterGlimpse)
        }
        .onDisappear {
            engineColdwaterGlimpse.teardownColdwaterGlimpse()
        }
    }

    // MARK: - Header

    private var gameHeaderColdwaterGlimpse: some View {
        HStack {
            Text("Round \(engineColdwaterGlimpse.currentRoundColdwaterGlimpse)")
                .font(.latoBlackColdwaterGlimpse(18))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.8), radius: 2, x: 0, y: 1)
                .shadow(color: ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.6), radius: 4, x: 0, y: 0)

            Spacer()

            if engineColdwaterGlimpse.phaseColdwaterGlimpse == .answeringColdwaterGlimpse ||
                engineColdwaterGlimpse.phaseColdwaterGlimpse == .correctFlashColdwaterGlimpse {
                Text("Score: \(engineColdwaterGlimpse.finalScoreColdwaterGlimpse)")
                    .font(.latoBlackColdwaterGlimpse(16))
                    .foregroundColor(ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse)
                    .shadow(color: .black.opacity(0.7), radius: 2, x: 0, y: 1)
            }

            Spacer()

            Button(action: {
                AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
                engineColdwaterGlimpse.togglePauseColdwaterGlimpse()
            }) {
                Image(systemName: "pause.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.7)))
                    .overlay(Circle().stroke(Color.white.opacity(0.2), lineWidth: 1))
                    .shadow(color: .black.opacity(0.4), radius: 2, y: 1)
            }
        }
    }

    // MARK: - Content switching

    @ViewBuilder
    private var mainContentColdwaterGlimpse: some View {
        switch engineColdwaterGlimpse.phaseColdwaterGlimpse {
        case .showingFieldColdwaterGlimpse:
            fishFieldColdwaterGlimpse
                .transition(.opacity)
                .padding(.horizontal, 16)
        case .answeringColdwaterGlimpse:
            if chosenModeColdwaterGlimpse == .compareColdwaterGlimpse {
                compareUIColdwaterGlimpse
                    .transition(.opacity)
            } else {
                exactUIColdwaterGlimpse
                    .transition(.opacity)
            }
        case .correctFlashColdwaterGlimpse:
            correctFeedbackColdwaterGlimpse
                .transition(.scale.combined(with: .opacity))
        default:
            EmptyView()
        }
    }

    // MARK: - Fish field

    private var fishFieldColdwaterGlimpse: some View {
        GeometryReader { geoColdwaterGlimpse in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(ColorPaletteColdwaterGlimpse.frostBlueColdwaterGlimpse.opacity(0.3), lineWidth: 1.5)
                    )

                ForEach(engineColdwaterGlimpse.fishListColdwaterGlimpse) { fishColdwaterGlimpse in
                    Image("FishSpecies\(fishColdwaterGlimpse.speciesIndexColdwaterGlimpse)ColdwaterGlimpse")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52 * fishColdwaterGlimpse.sizeFractionColdwaterGlimpse)
                        .rotationEffect(.degrees(fishColdwaterGlimpse.angleColdwaterGlimpse))
                        .position(
                            x: geoColdwaterGlimpse.size.width * fishColdwaterGlimpse.xNormColdwaterGlimpse,
                            y: geoColdwaterGlimpse.size.height * fishColdwaterGlimpse.yNormColdwaterGlimpse
                        )
                }
            }
        }
        .aspectRatio(0.85, contentMode: .fit)
    }

    // MARK: - Compare answer UI

    private var compareUIColdwaterGlimpse: some View {
        VStack(spacing: 28) {
            HStack(spacing: 16) {
                Image("FishSpecies\(engineColdwaterGlimpse.displaySpeciesColdwaterGlimpse)ColdwaterGlimpse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)

                Text("\(engineColdwaterGlimpse.comparisonValueColdwaterGlimpse)")
                    .font(.latoBlackColdwaterGlimpse(56))
                    .foregroundColor(ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse)
            }

            Text("Were there more, fewer, or exactly \(engineColdwaterGlimpse.comparisonValueColdwaterGlimpse)?")
                .font(.latoBlackColdwaterGlimpse(18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black.opacity(0.85), radius: 3, x: 0, y: 1)
                .shadow(color: ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.7), radius: 6, x: 0, y: 0)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.75))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.white.opacity(0.15), lineWidth: 1)
                        )
                )

            HStack(spacing: 12) {
                compareButtonColdwaterGlimpse(labelColdwaterGlimpse: "More", answerColdwaterGlimpse: .moreColdwaterGlimpse, colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse)
                compareButtonColdwaterGlimpse(labelColdwaterGlimpse: "Equal", answerColdwaterGlimpse: .equalColdwaterGlimpse, colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.skyBlueColdwaterGlimpse)
                compareButtonColdwaterGlimpse(labelColdwaterGlimpse: "Less", answerColdwaterGlimpse: .lessColdwaterGlimpse, colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.royalBlueColdwaterGlimpse)
            }
            .padding(.horizontal, 20)
        }
    }

    private func compareButtonColdwaterGlimpse(labelColdwaterGlimpse: String, answerColdwaterGlimpse: CompareAnswerColdwaterGlimpse, colorColdwaterGlimpse: Color) -> some View {
        Button(action: {
            AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
            HapticsManagerColdwaterGlimpse.impactColdwaterGlimpse(.medium)
            engineColdwaterGlimpse.submitCompareColdwaterGlimpse(answerColdwaterGlimpse)
        }) {
            Text(labelColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(colorColdwaterGlimpse)
                        .shadow(color: .black.opacity(0.3), radius: 4, y: 3)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
        }
        .buttonStyle(ScaleButtonStyleColdwaterGlimpse())
    }

    // MARK: - Exact answer UI

    private var exactUIColdwaterGlimpse: some View {
        VStack(spacing: 20) {
            Text("How many fish were there?")
                .font(.latoBlackColdwaterGlimpse(20))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.85), radius: 3, x: 0, y: 1)
                .shadow(color: ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.7), radius: 6, x: 0, y: 0)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.75))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.white.opacity(0.15), lineWidth: 1)
                        )
                )

            Text(exactInputColdwaterGlimpse.isEmpty ? "—" : exactInputColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(48))
                .foregroundColor(ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse)
                .frame(height: 60)

            numpadGridColdwaterGlimpse

            IceButtonColdwaterGlimpse(
                titleColdwaterGlimpse: "Confirm",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
                actionColdwaterGlimpse: {
                    guard let valueColdwaterGlimpse = Int(exactInputColdwaterGlimpse), !exactInputColdwaterGlimpse.isEmpty else { return }
                    engineColdwaterGlimpse.submitExactColdwaterGlimpse(valueColdwaterGlimpse)
                    exactInputColdwaterGlimpse = ""
                }
            )
            .padding(.horizontal, 60)
        }
        .padding(.horizontal, 24)
    }

    private var numpadGridColdwaterGlimpse: some View {
        let rowsColdwaterGlimpse: [[String]] = [
            ["1", "2", "3"],
            ["4", "5", "6"],
            ["7", "8", "9"],
            ["", "0", "⌫"]
        ]
        return VStack(spacing: 10) {
            ForEach(rowsColdwaterGlimpse, id: \.self) { rowColdwaterGlimpse in
                HStack(spacing: 10) {
                    ForEach(rowColdwaterGlimpse, id: \.self) { keyColdwaterGlimpse in
                        if keyColdwaterGlimpse.isEmpty {
                            Color.clear.frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(height: 52)
                        } else {
                            numpadKeyColdwaterGlimpse(keyColdwaterGlimpse)
                        }
                    }
                }
            }
        }
    }

    private func numpadKeyColdwaterGlimpse(_ keyColdwaterGlimpse: String) -> some View {
        Button(action: {
            AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
            HapticsManagerColdwaterGlimpse.impactColdwaterGlimpse(.light)
            if keyColdwaterGlimpse == "⌫" {
                if !exactInputColdwaterGlimpse.isEmpty { exactInputColdwaterGlimpse.removeLast() }
            } else {
                if exactInputColdwaterGlimpse.count < 3 { exactInputColdwaterGlimpse += keyColdwaterGlimpse }
            }
        }) {
            Text(keyColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(22))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(ColorPaletteColdwaterGlimpse.darkTealColdwaterGlimpse.opacity(0.8))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
        }
        .buttonStyle(ScaleButtonStyleColdwaterGlimpse())
    }

    // MARK: - Correct flash

    private var correctFeedbackColdwaterGlimpse: some View {
        VStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 72))
                .foregroundColor(.green)
                .shadow(color: .green.opacity(0.5), radius: 12)
            Text("Correct!")
                .font(.latoBlackColdwaterGlimpse(24))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    GameplayViewColdwaterGlimpse(
        chosenModeColdwaterGlimpse: .compareColdwaterGlimpse,
        onExitMenuColdwaterGlimpse: {},
        onPlayAgainColdwaterGlimpse: {}
    )
}

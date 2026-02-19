import SwiftUI
import Combine

enum GameModeColdwaterGlimpse {
    case compareColdwaterGlimpse
    case exactColdwaterGlimpse
}

enum GamePhaseColdwaterGlimpse: Equatable {
    case showingFieldColdwaterGlimpse
    case answeringColdwaterGlimpse
    case correctFlashColdwaterGlimpse
    case gameOverColdwaterGlimpse
    case pausedColdwaterGlimpse
}

enum CompareAnswerColdwaterGlimpse {
    case moreColdwaterGlimpse
    case lessColdwaterGlimpse
    case equalColdwaterGlimpse
}

struct FishOnFieldColdwaterGlimpse: Identifiable {
    let id = UUID()
    let speciesIndexColdwaterGlimpse: Int
    let xNormColdwaterGlimpse: CGFloat
    let yNormColdwaterGlimpse: CGFloat
    let angleColdwaterGlimpse: Double
    let sizeFractionColdwaterGlimpse: CGFloat
}

final class GameEngineColdwaterGlimpse: ObservableObject {
    @Published var currentRoundColdwaterGlimpse = 0
    @Published var phaseColdwaterGlimpse: GamePhaseColdwaterGlimpse = .showingFieldColdwaterGlimpse
    @Published var fishListColdwaterGlimpse: [FishOnFieldColdwaterGlimpse] = []
    @Published var timerProgressColdwaterGlimpse: CGFloat = 1.0
    @Published var comparisonValueColdwaterGlimpse = 0
    @Published var displaySpeciesColdwaterGlimpse = 1

    var activeModeColdwaterGlimpse: GameModeColdwaterGlimpse = .compareColdwaterGlimpse
    var realFishCountColdwaterGlimpse = 0
    var equalHitsColdwaterGlimpse = 0
    var exactHitsColdwaterGlimpse = 0

    private var timerSubColdwaterGlimpse: AnyCancellable?
    private var currentDurationColdwaterGlimpse: Double = 3.5
    private var savedPhaseColdwaterGlimpse: GamePhaseColdwaterGlimpse = .showingFieldColdwaterGlimpse
    private let settingsRefColdwaterGlimpse = SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse

    // MARK: - Public API

    func launchNewSessionColdwaterGlimpse(modeColdwaterGlimpse: GameModeColdwaterGlimpse) {
        activeModeColdwaterGlimpse = modeColdwaterGlimpse
        currentRoundColdwaterGlimpse = 0
        equalHitsColdwaterGlimpse = 0
        exactHitsColdwaterGlimpse = 0
        advanceRoundColdwaterGlimpse()
    }

    func advanceRoundColdwaterGlimpse() {
        currentRoundColdwaterGlimpse += 1
        withAnimation(.easeInOut(duration: 0.25)) {
            phaseColdwaterGlimpse = .showingFieldColdwaterGlimpse
        }
        currentDurationColdwaterGlimpse = durationForRoundColdwaterGlimpse()
        realFishCountColdwaterGlimpse = Int.random(in: rangeForRoundColdwaterGlimpse())
        buildFishArrayColdwaterGlimpse()
        buildComparisonColdwaterGlimpse()
        startCountdownColdwaterGlimpse()
    }

    func submitCompareColdwaterGlimpse(_ answerColdwaterGlimpse: CompareAnswerColdwaterGlimpse) {
        let correctColdwaterGlimpse: CompareAnswerColdwaterGlimpse
        if realFishCountColdwaterGlimpse > comparisonValueColdwaterGlimpse {
            correctColdwaterGlimpse = .moreColdwaterGlimpse
        } else if realFishCountColdwaterGlimpse < comparisonValueColdwaterGlimpse {
            correctColdwaterGlimpse = .lessColdwaterGlimpse
        } else {
            correctColdwaterGlimpse = .equalColdwaterGlimpse
        }
        if answerColdwaterGlimpse == correctColdwaterGlimpse {
            if answerColdwaterGlimpse == .equalColdwaterGlimpse { equalHitsColdwaterGlimpse += 1 }
            onCorrectColdwaterGlimpse()
        } else {
            onWrongColdwaterGlimpse()
        }
    }

    func submitExactColdwaterGlimpse(_ valueColdwaterGlimpse: Int) {
        if valueColdwaterGlimpse == realFishCountColdwaterGlimpse {
            exactHitsColdwaterGlimpse += 1
            onCorrectColdwaterGlimpse()
        } else {
            onWrongColdwaterGlimpse()
        }
    }

    func togglePauseColdwaterGlimpse() {
        if phaseColdwaterGlimpse == .pausedColdwaterGlimpse {
            resumeFromPauseColdwaterGlimpse()
        } else if phaseColdwaterGlimpse == .showingFieldColdwaterGlimpse || phaseColdwaterGlimpse == .answeringColdwaterGlimpse {
            savedPhaseColdwaterGlimpse = phaseColdwaterGlimpse
            timerSubColdwaterGlimpse?.cancel()
            withAnimation(.easeInOut(duration: 0.3)) { phaseColdwaterGlimpse = .pausedColdwaterGlimpse }
        }
    }

    func resumeFromPauseColdwaterGlimpse() {
        withAnimation(.easeInOut(duration: 0.3)) { phaseColdwaterGlimpse = savedPhaseColdwaterGlimpse }
        if savedPhaseColdwaterGlimpse == .showingFieldColdwaterGlimpse {
            resumeCountdownColdwaterGlimpse()
        }
    }

    func teardownColdwaterGlimpse() {
        timerSubColdwaterGlimpse?.cancel()
    }

    var finalScoreColdwaterGlimpse: Int { max(0, currentRoundColdwaterGlimpse - 1) }
    var minDurationColdwaterGlimpse: Double { 1.5 }

    // MARK: - Difficulty

    private func rangeForRoundColdwaterGlimpse() -> ClosedRange<Int> {
        switch currentRoundColdwaterGlimpse {
        case 1...3:  return 2...5
        case 4...7:  return 4...8
        case 8...12: return 6...12
        case 13...18: return 9...16
        default:     return 12...22
        }
    }

    private func durationForRoundColdwaterGlimpse() -> Double {
        switch currentRoundColdwaterGlimpse {
        case 1...3:  return 3.5
        case 4...7:  return 3.0
        case 8...12: return 2.5
        case 13...18: return 2.0
        default:     return 1.5
        }
    }

    // MARK: - Generation

    private func buildFishArrayColdwaterGlimpse() {
        var listColdwaterGlimpse: [FishOnFieldColdwaterGlimpse] = []
        for _ in 0..<realFishCountColdwaterGlimpse {
            listColdwaterGlimpse.append(
                FishOnFieldColdwaterGlimpse(
                    speciesIndexColdwaterGlimpse: Int.random(in: 1...6),
                    xNormColdwaterGlimpse: CGFloat.random(in: 0.08...0.88),
                    yNormColdwaterGlimpse: CGFloat.random(in: 0.08...0.88),
                    angleColdwaterGlimpse: Double.random(in: -25...25),
                    sizeFractionColdwaterGlimpse: CGFloat.random(in: 0.8...1.25)
                )
            )
        }
        fishListColdwaterGlimpse = listColdwaterGlimpse
    }

    private func buildComparisonColdwaterGlimpse() {
        let offsetColdwaterGlimpse = Int.random(in: -3...3)
        comparisonValueColdwaterGlimpse = max(1, realFishCountColdwaterGlimpse + offsetColdwaterGlimpse)
        displaySpeciesColdwaterGlimpse = Int.random(in: 1...6)
    }

    // MARK: - Timer

    private func startCountdownColdwaterGlimpse() {
        timerProgressColdwaterGlimpse = 1.0
        runTimerFromProgressColdwaterGlimpse(1.0)
    }

    private func resumeCountdownColdwaterGlimpse() {
        runTimerFromProgressColdwaterGlimpse(timerProgressColdwaterGlimpse)
    }

    private func runTimerFromProgressColdwaterGlimpse(_ startColdwaterGlimpse: CGFloat) {
        let tickColdwaterGlimpse: Double = 0.03
        let remainingColdwaterGlimpse = currentDurationColdwaterGlimpse * Double(startColdwaterGlimpse)
        let totalTicksColdwaterGlimpse = remainingColdwaterGlimpse / tickColdwaterGlimpse
        let stepColdwaterGlimpse = Double(startColdwaterGlimpse) / totalTicksColdwaterGlimpse

        timerSubColdwaterGlimpse = Timer.publish(every: tickColdwaterGlimpse, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let meColdwaterGlimpse = self else { return }
                meColdwaterGlimpse.timerProgressColdwaterGlimpse -= CGFloat(stepColdwaterGlimpse)
                if meColdwaterGlimpse.timerProgressColdwaterGlimpse <= 0 {
                    meColdwaterGlimpse.timerProgressColdwaterGlimpse = 0
                    meColdwaterGlimpse.timerSubColdwaterGlimpse?.cancel()
                    withAnimation(.easeInOut(duration: 0.3)) {
                        meColdwaterGlimpse.phaseColdwaterGlimpse = .answeringColdwaterGlimpse
                    }
                }
            }
    }

    // MARK: - Result handling

    private func onCorrectColdwaterGlimpse() {
        HapticsManagerColdwaterGlimpse.notifyColdwaterGlimpse(.success)
        evaluateAchievementsColdwaterGlimpse()
        withAnimation(.easeInOut(duration: 0.25)) { phaseColdwaterGlimpse = .correctFlashColdwaterGlimpse }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) { [weak self] in
            self?.advanceRoundColdwaterGlimpse()
        }
    }

    private func onWrongColdwaterGlimpse() {
        HapticsManagerColdwaterGlimpse.notifyColdwaterGlimpse(.error)
        timerSubColdwaterGlimpse?.cancel()

        if currentRoundColdwaterGlimpse == 1 {
            settingsRefColdwaterGlimpse.firstRoundLossCountColdwaterGlimpse += 1
        }
        let scoreColdwaterGlimpse = finalScoreColdwaterGlimpse
        if scoreColdwaterGlimpse > settingsRefColdwaterGlimpse.highScoreColdwaterGlimpse {
            settingsRefColdwaterGlimpse.highScoreColdwaterGlimpse = scoreColdwaterGlimpse
        }
        evaluateLossAchievementsColdwaterGlimpse()
        withAnimation(.easeInOut(duration: 0.4)) { phaseColdwaterGlimpse = .gameOverColdwaterGlimpse }
    }

    // MARK: - Achievements

    private func evaluateAchievementsColdwaterGlimpse() {
        let streakColdwaterGlimpse = currentRoundColdwaterGlimpse
        if streakColdwaterGlimpse >= 10 { settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("steadySwimmerColdwaterGlimpse") }
        if streakColdwaterGlimpse >= 30 { settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("arcticLegendColdwaterGlimpse") }
        if equalHitsColdwaterGlimpse >= 5 && activeModeColdwaterGlimpse == .compareColdwaterGlimpse {
            settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("equalizerColdwaterGlimpse")
        }
        if exactHitsColdwaterGlimpse >= 10 && activeModeColdwaterGlimpse == .exactColdwaterGlimpse {
            settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("sharpEyeColdwaterGlimpse")
        }
        if currentDurationColdwaterGlimpse <= minDurationColdwaterGlimpse {
            settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("iceGlanceColdwaterGlimpse")
        }
    }

    private func evaluateLossAchievementsColdwaterGlimpse() {
        if settingsRefColdwaterGlimpse.firstRoundLossCountColdwaterGlimpse >= 3 {
            settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("falseStartColdwaterGlimpse")
        }
        if finalScoreColdwaterGlimpse == 9 {
            settingsRefColdwaterGlimpse.unlockColdwaterGlimpse("almostThereColdwaterGlimpse")
        }
    }
}

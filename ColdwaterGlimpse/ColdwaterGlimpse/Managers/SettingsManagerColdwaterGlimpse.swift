import Foundation
import Combine

final class SettingsManagerColdwaterGlimpse: ObservableObject {
    static let sharedColdwaterGlimpse = SettingsManagerColdwaterGlimpse()

    private let storeColdwaterGlimpse = UserDefaults.standard

    @Published var soundEnabledColdwaterGlimpse: Bool {
        didSet { storeColdwaterGlimpse.set(soundEnabledColdwaterGlimpse, forKey: KeysColdwaterGlimpse.soundColdwaterGlimpse) }
    }
    @Published var vibrationEnabledColdwaterGlimpse: Bool {
        didSet { storeColdwaterGlimpse.set(vibrationEnabledColdwaterGlimpse, forKey: KeysColdwaterGlimpse.vibrationColdwaterGlimpse) }
    }
    @Published var highScoreColdwaterGlimpse: Int {
        didSet { storeColdwaterGlimpse.set(highScoreColdwaterGlimpse, forKey: KeysColdwaterGlimpse.highScoreColdwaterGlimpse) }
    }
    @Published var onboardingDoneColdwaterGlimpse: Bool {
        didSet { storeColdwaterGlimpse.set(onboardingDoneColdwaterGlimpse, forKey: KeysColdwaterGlimpse.onboardingColdwaterGlimpse) }
    }

    var firstRoundLossCountColdwaterGlimpse: Int {
        get { storeColdwaterGlimpse.integer(forKey: KeysColdwaterGlimpse.firstRoundLossColdwaterGlimpse) }
        set { storeColdwaterGlimpse.set(newValue, forKey: KeysColdwaterGlimpse.firstRoundLossColdwaterGlimpse) }
    }

    private enum KeysColdwaterGlimpse {
        static let soundColdwaterGlimpse = "soundEnabledColdwaterGlimpse"
        static let vibrationColdwaterGlimpse = "vibrationEnabledColdwaterGlimpse"
        static let highScoreColdwaterGlimpse = "highScoreColdwaterGlimpse"
        static let onboardingColdwaterGlimpse = "onboardingDoneColdwaterGlimpse"
        static let firstRoundLossColdwaterGlimpse = "firstRoundLossCountColdwaterGlimpse"
        static let achievementsColdwaterGlimpse = "unlockedAchievementsColdwaterGlimpse"
    }

    private init() {
        let dColdwaterGlimpse = UserDefaults.standard
        if dColdwaterGlimpse.object(forKey: KeysColdwaterGlimpse.soundColdwaterGlimpse) == nil {
            dColdwaterGlimpse.set(true, forKey: KeysColdwaterGlimpse.soundColdwaterGlimpse)
        }
        if dColdwaterGlimpse.object(forKey: KeysColdwaterGlimpse.vibrationColdwaterGlimpse) == nil {
            dColdwaterGlimpse.set(true, forKey: KeysColdwaterGlimpse.vibrationColdwaterGlimpse)
        }
        self.soundEnabledColdwaterGlimpse = dColdwaterGlimpse.bool(forKey: KeysColdwaterGlimpse.soundColdwaterGlimpse)
        self.vibrationEnabledColdwaterGlimpse = dColdwaterGlimpse.bool(forKey: KeysColdwaterGlimpse.vibrationColdwaterGlimpse)
        self.highScoreColdwaterGlimpse = dColdwaterGlimpse.integer(forKey: KeysColdwaterGlimpse.highScoreColdwaterGlimpse)
        self.onboardingDoneColdwaterGlimpse = dColdwaterGlimpse.bool(forKey: KeysColdwaterGlimpse.onboardingColdwaterGlimpse)
    }

    func isUnlockedColdwaterGlimpse(_ achievementIdColdwaterGlimpse: String) -> Bool {
        let arrayColdwaterGlimpse = storeColdwaterGlimpse.stringArray(forKey: KeysColdwaterGlimpse.achievementsColdwaterGlimpse) ?? []
        return arrayColdwaterGlimpse.contains(achievementIdColdwaterGlimpse)
    }

    func unlockColdwaterGlimpse(_ achievementIdColdwaterGlimpse: String) {
        var arrayColdwaterGlimpse = storeColdwaterGlimpse.stringArray(forKey: KeysColdwaterGlimpse.achievementsColdwaterGlimpse) ?? []
        guard !arrayColdwaterGlimpse.contains(achievementIdColdwaterGlimpse) else { return }
        arrayColdwaterGlimpse.append(achievementIdColdwaterGlimpse)
        storeColdwaterGlimpse.set(arrayColdwaterGlimpse, forKey: KeysColdwaterGlimpse.achievementsColdwaterGlimpse)
        objectWillChange.send()
    }

    func resetHighScoreColdwaterGlimpse() {
        highScoreColdwaterGlimpse = 0
    }
}

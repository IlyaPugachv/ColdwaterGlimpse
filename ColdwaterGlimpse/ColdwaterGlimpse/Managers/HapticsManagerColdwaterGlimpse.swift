import UIKit

enum HapticsManagerColdwaterGlimpse {
    static func impactColdwaterGlimpse(_ styleColdwaterGlimpse: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        guard SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse.vibrationEnabledColdwaterGlimpse else { return }
        let generatorColdwaterGlimpse = UIImpactFeedbackGenerator(style: styleColdwaterGlimpse)
        generatorColdwaterGlimpse.impactOccurred()
    }

    static func notifyColdwaterGlimpse(_ typeColdwaterGlimpse: UINotificationFeedbackGenerator.FeedbackType) {
        guard SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse.vibrationEnabledColdwaterGlimpse else { return }
        let generatorColdwaterGlimpse = UINotificationFeedbackGenerator()
        generatorColdwaterGlimpse.notificationOccurred(typeColdwaterGlimpse)
    }
}

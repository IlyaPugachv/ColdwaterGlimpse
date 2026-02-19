import AVFoundation
import Combine

final class AudioManagerColdwaterGlimpse: ObservableObject {
    static let sharedColdwaterGlimpse = AudioManagerColdwaterGlimpse()

    private var musicPlayerColdwaterGlimpse: AVAudioPlayer?
    private var clickPlayerColdwaterGlimpse: AVAudioPlayer?
    @Published var isMusicActiveColdwaterGlimpse = false

    private init() {
        setupSessionColdwaterGlimpse()
    }

    private func setupSessionColdwaterGlimpse() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch { }
    }

    func startMusicColdwaterGlimpse() {
        guard SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse.soundEnabledColdwaterGlimpse else { return }
        guard musicPlayerColdwaterGlimpse?.isPlaying != true else { return }

        guard let urlColdwaterGlimpse = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        do {
            musicPlayerColdwaterGlimpse = try AVAudioPlayer(contentsOf: urlColdwaterGlimpse)
            musicPlayerColdwaterGlimpse?.numberOfLoops = -1
            musicPlayerColdwaterGlimpse?.volume = 0.35
            musicPlayerColdwaterGlimpse?.play()
            isMusicActiveColdwaterGlimpse = true
        } catch { }
    }

    func stopMusicColdwaterGlimpse() {
        musicPlayerColdwaterGlimpse?.stop()
        musicPlayerColdwaterGlimpse = nil
        isMusicActiveColdwaterGlimpse = false
    }

    func playClickColdwaterGlimpse() {
        guard SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse.soundEnabledColdwaterGlimpse else { return }
        guard let urlColdwaterGlimpse = Bundle.main.url(forResource: "clickButton", withExtension: "mp3") else { return }
        do {
            clickPlayerColdwaterGlimpse = try AVAudioPlayer(contentsOf: urlColdwaterGlimpse)
            clickPlayerColdwaterGlimpse?.play()
        } catch { }
    }

    func syncWithSettingsColdwaterGlimpse() {
        if SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse.soundEnabledColdwaterGlimpse {
            if !isMusicActiveColdwaterGlimpse { startMusicColdwaterGlimpse() }
        } else {
            stopMusicColdwaterGlimpse()
        }
    }
}

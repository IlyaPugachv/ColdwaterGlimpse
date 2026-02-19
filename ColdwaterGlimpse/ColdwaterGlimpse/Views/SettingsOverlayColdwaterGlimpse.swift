import SwiftUI

struct SettingsOverlayColdwaterGlimpse: View {
    let onCloseColdwaterGlimpse: () -> Void

    @ObservedObject private var settingsColdwaterGlimpse = SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse
    @State private var appearedColdwaterGlimpse = false
    @State private var showResetConfirmColdwaterGlimpse = false

    var body: some View {
        ZStack {
            FrostedPanelColdwaterGlimpse(builderColdwaterGlimpse: {
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
                            onCloseColdwaterGlimpse()
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            .font(.latoBlackColdwaterGlimpse(16))
                            .foregroundColor(.white)
                        }
                        Spacer()
                    }

                    Text("Settings")
                        .font(.latoBlackColdwaterGlimpse(26))
                        .foregroundColor(.white)

                    toggleRowColdwaterGlimpse(
                        titleColdwaterGlimpse: "Sound",
                        iconColdwaterGlimpse: "speaker.wave.2.fill",
                        isOnColdwaterGlimpse: $settingsColdwaterGlimpse.soundEnabledColdwaterGlimpse
                    )
                    .onChange(of: settingsColdwaterGlimpse.soundEnabledColdwaterGlimpse) { _ in
                        AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.syncWithSettingsColdwaterGlimpse()
                    }

                    toggleRowColdwaterGlimpse(
                        titleColdwaterGlimpse: "Vibration",
                        iconColdwaterGlimpse: "iphone.radiowaves.left.and.right",
                        isOnColdwaterGlimpse: $settingsColdwaterGlimpse.vibrationEnabledColdwaterGlimpse
                    )

                    Divider().background(Color.white.opacity(0.2))

                    Button(action: {
                        AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
                        showResetConfirmColdwaterGlimpse = true
                    }) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text("Reset High Score")
                        }
                        .font(.latoBlackColdwaterGlimpse(16))
                        .foregroundColor(ColorPaletteColdwaterGlimpse.crimsonRedColdwaterGlimpse)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(ColorPaletteColdwaterGlimpse.crimsonRedColdwaterGlimpse.opacity(0.15))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(ColorPaletteColdwaterGlimpse.crimsonRedColdwaterGlimpse.opacity(0.4), lineWidth: 1)
                        )
                    }
                }
                .frame(maxWidth: 300)
            })
            .scaleEffect(appearedColdwaterGlimpse ? 1 : 0.85)
            .opacity(appearedColdwaterGlimpse ? 1 : 0)
            .padding(.horizontal, 28)

            if showResetConfirmColdwaterGlimpse {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.identity)

                resetConfirmPanelColdwaterGlimpse
                    .transition(.opacity.combined(with: .scale(scale: 0.9)))
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                appearedColdwaterGlimpse = true
            }
        }
    }

    // MARK: - Toggle row

    private func toggleRowColdwaterGlimpse(titleColdwaterGlimpse: String, iconColdwaterGlimpse: String, isOnColdwaterGlimpse: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: iconColdwaterGlimpse)
                .foregroundColor(ColorPaletteColdwaterGlimpse.frostBlueColdwaterGlimpse)
                .frame(width: 28)
            Text(titleColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(17))
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: isOnColdwaterGlimpse)
                .labelsHidden()
                .tint(ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse)
        }
    }

    // MARK: - Reset confirmation

    private var resetConfirmPanelColdwaterGlimpse: some View {
        FrostedPanelColdwaterGlimpse(builderColdwaterGlimpse: {
            VStack(spacing: 16) {
                Text("Reset High Score?")
                    .font(.latoBlackColdwaterGlimpse(20))
                    .foregroundColor(.white)

                Text("This action cannot be undone.")
                    .font(.latoBlackColdwaterGlimpse(14))
                    .foregroundColor(.white.opacity(0.6))

                HStack(spacing: 12) {
                    IceButtonColdwaterGlimpse(
                        titleColdwaterGlimpse: "Cancel",
                        colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.darkTealColdwaterGlimpse,
                        actionColdwaterGlimpse: {
                            withAnimation { showResetConfirmColdwaterGlimpse = false }
                        }
                    )
                    IceButtonColdwaterGlimpse(
                        titleColdwaterGlimpse: "Reset",
                        colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.crimsonRedColdwaterGlimpse,
                        actionColdwaterGlimpse: {
                            settingsColdwaterGlimpse.resetHighScoreColdwaterGlimpse()
                            withAnimation { showResetConfirmColdwaterGlimpse = false }
                        }
                    )
                }
            }
            .frame(maxWidth: 260)
        })
        .padding(.horizontal, 40)
    }
}

#Preview {
    ZStack {
        BackgroundViewColdwaterGlimpse()
        SettingsOverlayColdwaterGlimpse(onCloseColdwaterGlimpse: {})
    }
}

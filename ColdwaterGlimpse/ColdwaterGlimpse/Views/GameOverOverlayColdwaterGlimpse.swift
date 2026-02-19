import SwiftUI

struct GameOverOverlayColdwaterGlimpse: View {
    let scoreColdwaterGlimpse: Int
    let recordColdwaterGlimpse: Int
    let onReplayColdwaterGlimpse: () -> Void
    let onMenuColdwaterGlimpse: () -> Void

    @State private var appearedColdwaterGlimpse = false
    private var isNewRecordColdwaterGlimpse: Bool { scoreColdwaterGlimpse >= recordColdwaterGlimpse && scoreColdwaterGlimpse > 0 }

    var body: some View {
        ZStack {
            FrostedPanelColdwaterGlimpse(builderColdwaterGlimpse: {
                VStack(spacing: 16) {
                    Text("Game Over")
                        .font(.latoBlackColdwaterGlimpse(30))
                        .foregroundColor(ColorPaletteColdwaterGlimpse.crimsonRedColdwaterGlimpse)

                    if isNewRecordColdwaterGlimpse {
                        Text("New Record!")
                            .font(.latoBlackColdwaterGlimpse(16))
                            .foregroundColor(ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse)
                    }

                    VStack(spacing: 8) {
                        statRowColdwaterGlimpse(labelColdwaterGlimpse: "Rounds", valueColdwaterGlimpse: "\(scoreColdwaterGlimpse)")
                        statRowColdwaterGlimpse(labelColdwaterGlimpse: "Best", valueColdwaterGlimpse: "\(recordColdwaterGlimpse)")
                    }
                    .padding(.vertical, 8)

                    VStack(spacing: 12) {
                        IceButtonColdwaterGlimpse(
                            titleColdwaterGlimpse: "Play Again",
                            colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
                            actionColdwaterGlimpse: onReplayColdwaterGlimpse
                        )
                        IceButtonColdwaterGlimpse(
                            titleColdwaterGlimpse: "Exit to Menu",
                            colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.darkTealColdwaterGlimpse,
                            actionColdwaterGlimpse: onMenuColdwaterGlimpse
                        )
                    }
                }
                .frame(maxWidth: 280)
            })
            .scaleEffect(appearedColdwaterGlimpse ? 1 : 0.85)
            .opacity(appearedColdwaterGlimpse ? 1 : 0)
            .padding(.horizontal, 32)
        }
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                appearedColdwaterGlimpse = true
            }
        }
    }

    private func statRowColdwaterGlimpse(labelColdwaterGlimpse: String, valueColdwaterGlimpse: String) -> some View {
        HStack {
            Text(labelColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(16))
                .foregroundColor(ColorPaletteColdwaterGlimpse.frostBlueColdwaterGlimpse)
            Spacer()
            Text(valueColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(20))
                .foregroundColor(.white)
        }
    }
}

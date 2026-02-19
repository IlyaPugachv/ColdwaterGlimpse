import SwiftUI

struct PauseOverlayColdwaterGlimpse: View {
    let onContinueColdwaterGlimpse: () -> Void
    let onRestartColdwaterGlimpse: () -> Void
    let onExitColdwaterGlimpse: () -> Void

    @State private var appearedColdwaterGlimpse = false

    var body: some View {
        ZStack {
            FrostedPanelColdwaterGlimpse(builderColdwaterGlimpse: {
                VStack(spacing: 20) {
                    Image(systemName: "pause.circle.fill")
                        .font(.system(size: 52))
                        .foregroundColor(ColorPaletteColdwaterGlimpse.frostBlueColdwaterGlimpse)

                    Text("Paused")
                        .font(.latoBlackColdwaterGlimpse(28))
                        .foregroundColor(.white)

                    VStack(spacing: 12) {
                        IceButtonColdwaterGlimpse(
                            titleColdwaterGlimpse: "Continue",
                            colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
                            actionColdwaterGlimpse: onContinueColdwaterGlimpse
                        )
                        IceButtonColdwaterGlimpse(
                            titleColdwaterGlimpse: "Restart",
                            colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.royalBlueColdwaterGlimpse,
                            actionColdwaterGlimpse: onRestartColdwaterGlimpse
                        )
                        IceButtonColdwaterGlimpse(
                            titleColdwaterGlimpse: "Exit to Menu",
                            colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.darkTealColdwaterGlimpse,
                            actionColdwaterGlimpse: onExitColdwaterGlimpse
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
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                appearedColdwaterGlimpse = true
            }
        }
    }
}

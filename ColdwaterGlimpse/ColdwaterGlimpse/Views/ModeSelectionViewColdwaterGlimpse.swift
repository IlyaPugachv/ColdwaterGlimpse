import SwiftUI

struct ModeSelectionViewColdwaterGlimpse: View {
    let onSelectModeColdwaterGlimpse: (GameModeColdwaterGlimpse) -> Void
    let onBackColdwaterGlimpse: () -> Void

    @State private var appearedColdwaterGlimpse = false

    var body: some View {
        ZStack {
            BackgroundViewColdwaterGlimpse()

            VStack(spacing: 0) {
                headerBarColdwaterGlimpse

                Spacer()

                Text("Choose Mode")
                    .font(.latoBlackColdwaterGlimpse(30))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 4, y: 2)

                Spacer().frame(height: 40)

                modeCardsColdwaterGlimpse
                    .padding(.horizontal, 32)

                Spacer()
            }
            .opacity(appearedColdwaterGlimpse ? 1 : 0)
            .offset(y: appearedColdwaterGlimpse ? 0 : 20)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) { appearedColdwaterGlimpse = true }
        }
    }

    private var headerBarColdwaterGlimpse: some View {
        HStack {
            Button(action: {
                AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
                onBackColdwaterGlimpse()
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
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }

    private var modeCardsColdwaterGlimpse: some View {
        VStack(spacing: 18) {
            modeCardItemColdwaterGlimpse(
                titleColdwaterGlimpse: "More / Less / Equal",
                subtitleColdwaterGlimpse: "Compare fish count with a number",
                iconNameColdwaterGlimpse: "scale.3d",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
                modeColdwaterGlimpse: .compareColdwaterGlimpse
            )
            modeCardItemColdwaterGlimpse(
                titleColdwaterGlimpse: "Enter Exact Number",
                subtitleColdwaterGlimpse: "Type the precise fish count",
                iconNameColdwaterGlimpse: "number.circle.fill",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.royalBlueColdwaterGlimpse,
                modeColdwaterGlimpse: .exactColdwaterGlimpse
            )
        }
    }

    private func modeCardItemColdwaterGlimpse(
        titleColdwaterGlimpse: String,
        subtitleColdwaterGlimpse: String,
        iconNameColdwaterGlimpse: String,
        colorColdwaterGlimpse: Color,
        modeColdwaterGlimpse: GameModeColdwaterGlimpse
    ) -> some View {
        Button(action: {
            AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
            HapticsManagerColdwaterGlimpse.impactColdwaterGlimpse(.medium)
            onSelectModeColdwaterGlimpse(modeColdwaterGlimpse)
        }) {
            HStack(spacing: 16) {
                Image(systemName: iconNameColdwaterGlimpse)
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .frame(width: 56)

                VStack(alignment: .leading, spacing: 4) {
                    Text(titleColdwaterGlimpse)
                        .font(.latoBlackColdwaterGlimpse(18))
                        .foregroundColor(.white)
                    Text(subtitleColdwaterGlimpse)
                        .font(.latoBlackColdwaterGlimpse(12))
                        .foregroundColor(.white.opacity(0.7))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [colorColdwaterGlimpse, colorColdwaterGlimpse.opacity(0.65)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: .black.opacity(0.35), radius: 8, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(ScaleButtonStyleColdwaterGlimpse())
    }
}

#Preview {
    ModeSelectionViewColdwaterGlimpse(
        onSelectModeColdwaterGlimpse: { _ in },
        onBackColdwaterGlimpse: {}
    )
}

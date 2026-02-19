import SwiftUI

struct OnboardingViewColdwaterGlimpse: View {
    let onCompleteColdwaterGlimpse: () -> Void

    @State private var currentPageColdwaterGlimpse = 0

    private let pagesColdwaterGlimpse: [(imageColdwaterGlimpse: String, textColdwaterGlimpse: String)] = [
        ("InfoSlide1ColdwaterGlimpse",
         "Remember how many fish appear on the screen. You'll only have a few seconds before the field disappears."),
        ("InfoSlide2ColdwaterGlimpse",
         "After the field disappears, answer: were there more, fewer, or exactly that many fish — or enter the exact number in another mode. A wrong answer ends the game.")
    ]

    var body: some View {
        ZStack {
            BackgroundViewColdwaterGlimpse()

            VStack(spacing: 0) {
                onboardingHeaderColdwaterGlimpse
                    .padding(.horizontal, 20)
                    .padding(.top, 16)

                TabView(selection: $currentPageColdwaterGlimpse) {
                    ForEach(0..<pagesColdwaterGlimpse.count, id: \.self) { indexColdwaterGlimpse in
                        onboardingCardColdwaterGlimpse(indexColdwaterGlimpse: indexColdwaterGlimpse)
                            .tag(indexColdwaterGlimpse)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut(duration: 0.35), value: currentPageColdwaterGlimpse)

                pageIndicatorColdwaterGlimpse
                    .padding(.top, 12)

                actionButtonColdwaterGlimpse
                    .padding(.horizontal, 40)
                    .padding(.top, 24)
                    .padding(.bottom, 40)
            }
        }
    }

    // MARK: - Subviews

    private func onboardingCardColdwaterGlimpse(indexColdwaterGlimpse: Int) -> some View {
        let pageColdwaterGlimpse = pagesColdwaterGlimpse[indexColdwaterGlimpse]
        return VStack(spacing: 20) {
            Spacer()

            Image(pageColdwaterGlimpse.imageColdwaterGlimpse)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.3), radius: 12, y: 6)
                .padding(.horizontal, 24)

            Text(pageColdwaterGlimpse.textColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(19))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.72))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                )
                .padding(.horizontal, 28)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()
        }
    }

    private var pageIndicatorColdwaterGlimpse: some View {
        HStack(spacing: 10) {
            ForEach(0..<pagesColdwaterGlimpse.count, id: \.self) { iColdwaterGlimpse in
                Capsule()
                    .fill(iColdwaterGlimpse == currentPageColdwaterGlimpse ? Color.white : Color.white.opacity(0.45))
                    .frame(width: iColdwaterGlimpse == currentPageColdwaterGlimpse ? 30 : 12, height: 12)
                    .overlay(
                        Capsule()
                            .stroke(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.35), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.2), radius: 3, y: 1)
                    .animation(.easeInOut(duration: 0.2), value: currentPageColdwaterGlimpse)
            }
        }
    }

    private var onboardingHeaderColdwaterGlimpse: some View {
        HStack {
            Button(action: {
                AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
                guard currentPageColdwaterGlimpse > 0 else { return }
                withAnimation(.easeInOut(duration: 0.25)) {
                    currentPageColdwaterGlimpse -= 1
                }
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .font(.latoBlackColdwaterGlimpse(16))
                .foregroundColor(currentPageColdwaterGlimpse > 0 ? .white : .white.opacity(0.4))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.65))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
            }
            .disabled(currentPageColdwaterGlimpse == 0)

            Spacer()
        }
    }

    private var actionButtonColdwaterGlimpse: some View {
        IceButtonColdwaterGlimpse(
            titleColdwaterGlimpse: currentPageColdwaterGlimpse < pagesColdwaterGlimpse.count - 1 ? "Next" : "Get Started",
            colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
            actionColdwaterGlimpse: {
                if currentPageColdwaterGlimpse < pagesColdwaterGlimpse.count - 1 {
                    withAnimation { currentPageColdwaterGlimpse += 1 }
                } else {
                    onCompleteColdwaterGlimpse()
                }
            }
        )
    }
}

#Preview {
    OnboardingViewColdwaterGlimpse(onCompleteColdwaterGlimpse: {})
}

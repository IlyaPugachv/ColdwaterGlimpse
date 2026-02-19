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
                .font(.latoBlackColdwaterGlimpse(16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()
        }
    }

    private var pageIndicatorColdwaterGlimpse: some View {
        HStack(spacing: 10) {
            ForEach(0..<pagesColdwaterGlimpse.count, id: \.self) { iColdwaterGlimpse in
                Circle()
                    .fill(iColdwaterGlimpse == currentPageColdwaterGlimpse ? Color.white : Color.white.opacity(0.35))
                    .frame(width: 10, height: 10)
                    .animation(.easeInOut(duration: 0.2), value: currentPageColdwaterGlimpse)
            }
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

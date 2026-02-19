import SwiftUI

enum ColorPaletteColdwaterGlimpse {
    static let deepNavyColdwaterGlimpse = Color(red: 11/255, green: 48/255, blue: 104/255)
    static let royalBlueColdwaterGlimpse = Color(red: 40/255, green: 111/255, blue: 181/255)
    static let skyBlueColdwaterGlimpse = Color(red: 99/255, green: 158/255, blue: 212/255)
    static let frostBlueColdwaterGlimpse = Color(red: 168/255, green: 197/255, blue: 226/255)
    static let iceMistColdwaterGlimpse = Color(red: 199/255, green: 209/255, blue: 227/255)
    static let steelBlueColdwaterGlimpse = Color(red: 140/255, green: 170/255, blue: 205/255)
    static let darkTealColdwaterGlimpse = Color(red: 33/255, green: 75/255, blue: 124/255)
    static let warmOrangeColdwaterGlimpse = Color(red: 223/255, green: 134/255, blue: 90/255)
    static let crimsonRedColdwaterGlimpse = Color(red: 204/255, green: 65/255, blue: 54/255)
    static let deepMaroonColdwaterGlimpse = Color(red: 122/255, green: 39/255, blue: 39/255)
    static let goldAccentColdwaterGlimpse = Color(red: 255/255, green: 215/255, blue: 0/255)
}

extension Font {
    static func latoBlackColdwaterGlimpse(_ sizeColdwaterGlimpse: CGFloat) -> Font {
        .custom("Lato-Black", size: sizeColdwaterGlimpse)
    }
}

struct BackgroundViewColdwaterGlimpse: View {
    var body: some View {
        Image("BackgroundColdwaterGlimpse")
            .resizable()
            .ignoresSafeArea()
    }
}

struct IceButtonColdwaterGlimpse: View {
    let titleColdwaterGlimpse: String
    let colorColdwaterGlimpse: Color
    var widthFractionColdwaterGlimpse: CGFloat = 1.0
    let actionColdwaterGlimpse: () -> Void

    var body: some View {
        Button(action: {
            AudioManagerColdwaterGlimpse.sharedColdwaterGlimpse.playClickColdwaterGlimpse()
            HapticsManagerColdwaterGlimpse.impactColdwaterGlimpse(.light)
            actionColdwaterGlimpse()
        }) {
            Text(titleColdwaterGlimpse)
                .font(.latoBlackColdwaterGlimpse(18))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [colorColdwaterGlimpse, colorColdwaterGlimpse.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.4), radius: 6, y: 4)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                )
        }
        .buttonStyle(ScaleButtonStyleColdwaterGlimpse())
    }
}

struct ScaleButtonStyleColdwaterGlimpse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.12), value: configuration.isPressed)
    }
}

struct FrostedPanelColdwaterGlimpse<ContentColdwaterGlimpse: View>: View {
    let contentColdwaterGlimpse: ContentColdwaterGlimpse

    init(@ViewBuilder builderColdwaterGlimpse: () -> ContentColdwaterGlimpse) {
        self.contentColdwaterGlimpse = builderColdwaterGlimpse()
    }

    var body: some View {
        contentColdwaterGlimpse
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.85))
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        ColorPaletteColdwaterGlimpse.frostBlueColdwaterGlimpse.opacity(0.6),
                                        ColorPaletteColdwaterGlimpse.steelBlueColdwaterGlimpse.opacity(0.15)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
                    .shadow(color: .black.opacity(0.4), radius: 16, y: 8)
            )
    }
}

struct TimerBarColdwaterGlimpse: View {
    let progressColdwaterGlimpse: CGFloat

    var body: some View {
        GeometryReader { geoColdwaterGlimpse in
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white.opacity(0.2))
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            progressColdwaterGlimpse > 0.3
                                ? ColorPaletteColdwaterGlimpse.skyBlueColdwaterGlimpse
                                : ColorPaletteColdwaterGlimpse.crimsonRedColdwaterGlimpse
                        )
                        .frame(width: geoColdwaterGlimpse.size.width * max(0, progressColdwaterGlimpse))
                }
        }
        .frame(height: 10)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

struct SnowflakeParticleColdwaterGlimpse: View {
    @State private var yOffsetColdwaterGlimpse: CGFloat = -20
    @State private var opacityColdwaterGlimpse: Double = 0
    let delayColdwaterGlimpse: Double
    let sizeColdwaterGlimpse: CGFloat

    var body: some View {
        Circle()
            .fill(Color.white.opacity(opacityColdwaterGlimpse))
            .frame(width: sizeColdwaterGlimpse, height: sizeColdwaterGlimpse)
            .offset(y: yOffsetColdwaterGlimpse)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: Double.random(in: 3...6))
                    .repeatForever(autoreverses: false)
                    .delay(delayColdwaterGlimpse)
                ) {
                    yOffsetColdwaterGlimpse = UIScreen.main.bounds.height + 20
                }
                withAnimation(
                    .easeInOut(duration: 1.5)
                    .repeatForever(autoreverses: true)
                    .delay(delayColdwaterGlimpse)
                ) {
                    opacityColdwaterGlimpse = Double.random(in: 0.3...0.7)
                }
            }
    }
}

#Preview {
    ZStack {
        BackgroundViewColdwaterGlimpse()
        VStack(spacing: 20) {
            FrostedPanelColdwaterGlimpse(builderColdwaterGlimpse: {
                Text("Ice Panel")
                    .font(.latoBlackColdwaterGlimpse(24))
                    .foregroundColor(.white)
            })
            TimerBarColdwaterGlimpse(progressColdwaterGlimpse: 0.65)
                .padding(.horizontal, 40)
            IceButtonColdwaterGlimpse(
                titleColdwaterGlimpse: "Play",
                colorColdwaterGlimpse: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse,
                actionColdwaterGlimpse: {}
            )
            .padding(.horizontal, 40)
        }
    }
}

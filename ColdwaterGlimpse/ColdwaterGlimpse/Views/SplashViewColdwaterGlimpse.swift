import SwiftUI

struct SplashViewColdwaterGlimpse: View {
    let onFinishedColdwaterGlimpse: () -> Void

    @State private var logoScaleColdwaterGlimpse: CGFloat = 0.6
    @State private var logoOpacityColdwaterGlimpse: Double = 0
    @State private var shimmerOffsetColdwaterGlimpse: CGFloat = -200

    var body: some View {
        ZStack {
            BackgroundViewColdwaterGlimpse()

            VStack {
                Spacer()

                ZStack {
                    Image("LogoColdwaterGlimpse")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                        .scaleEffect(logoScaleColdwaterGlimpse)
                        .opacity(logoOpacityColdwaterGlimpse)
                        .shadow(color: ColorPaletteColdwaterGlimpse.skyBlueColdwaterGlimpse.opacity(0.6), radius: 30, y: 0)

                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [.clear, .white.opacity(0.25), .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 60, height: 220)
                        .offset(x: shimmerOffsetColdwaterGlimpse)
                        .mask(
                            Image("LogoColdwaterGlimpse")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 220)
                        )
                }

                Spacer()

                ZStack {
                    Circle()
                        .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.72))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.22), lineWidth: 1)
                        )

                    ProgressView()
                        .progressViewStyle(
                            CircularProgressViewStyle(
                                tint: ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse
                            )
                        )
                        .scaleEffect(1.35)
                }
                .padding(.bottom, 60)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                logoScaleColdwaterGlimpse = 1.0
                logoOpacityColdwaterGlimpse = 1.0
            }
            withAnimation(.easeInOut(duration: 1.8).repeatForever(autoreverses: false)) {
                shimmerOffsetColdwaterGlimpse = 200
            }
            let delayColdwaterGlimpse = Double.random(in: 2.47...5.77)
            DispatchQueue.main.asyncAfter(deadline: .now() + delayColdwaterGlimpse) {
                onFinishedColdwaterGlimpse()
            }
        }
    }
}

#Preview {
    SplashViewColdwaterGlimpse(onFinishedColdwaterGlimpse: {})
}

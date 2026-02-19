import SwiftUI

struct AchievementsViewColdwaterGlimpse: View {
    let onBackColdwaterGlimpse: () -> Void

    @ObservedObject private var settingsColdwaterGlimpse = SettingsManagerColdwaterGlimpse.sharedColdwaterGlimpse
    @State private var appearedColdwaterGlimpse = false

    var body: some View {
        ZStack {
            BackgroundViewColdwaterGlimpse()

            VStack(spacing: 0) {
                headerColdwaterGlimpse

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 14) {
                        ForEach(AchievementDefinitionColdwaterGlimpse.catalogColdwaterGlimpse) { itemColdwaterGlimpse in
                            let unlockedColdwaterGlimpse = settingsColdwaterGlimpse.isUnlockedColdwaterGlimpse(itemColdwaterGlimpse.id)
                            achievementCardColdwaterGlimpse(
                                defColdwaterGlimpse: itemColdwaterGlimpse,
                                isUnlockedColdwaterGlimpse: unlockedColdwaterGlimpse
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
            .opacity(appearedColdwaterGlimpse ? 1 : 0)
            .offset(y: appearedColdwaterGlimpse ? 0 : 20)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) { appearedColdwaterGlimpse = true }
        }
    }

    // MARK: - Header

    private var headerColdwaterGlimpse: some View {
        ZStack {
            Text("Achievements")
                .font(.latoBlackColdwaterGlimpse(22))
                .foregroundColor(.white)

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
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }

    // MARK: - Card

    private func achievementCardColdwaterGlimpse(defColdwaterGlimpse: AchievementDefinitionColdwaterGlimpse, isUnlockedColdwaterGlimpse: Bool) -> some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(
                        isUnlockedColdwaterGlimpse
                            ? ColorPaletteColdwaterGlimpse.warmOrangeColdwaterGlimpse.opacity(0.3)
                            : Color.white.opacity(0.05)
                    )
                    .frame(width: 56, height: 56)

                if isUnlockedColdwaterGlimpse {
                    Image("AwardIconColdwaterGlimpse")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                } else {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white.opacity(0.3))
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(defColdwaterGlimpse.titleColdwaterGlimpse)
                    .font(.latoBlackColdwaterGlimpse(16))
                    .foregroundColor(isUnlockedColdwaterGlimpse ? .white : .white.opacity(0.45))

                Text(defColdwaterGlimpse.descriptionColdwaterGlimpse)
                    .font(.latoBlackColdwaterGlimpse(12))
                    .foregroundColor(isUnlockedColdwaterGlimpse ? .white.opacity(0.7) : .white.opacity(0.3))
                    .lineLimit(2)
            }

            Spacer()

            if isUnlockedColdwaterGlimpse {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse)
                    .font(.system(size: 22))
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(ColorPaletteColdwaterGlimpse.deepNavyColdwaterGlimpse.opacity(0.7))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(
                            isUnlockedColdwaterGlimpse
                                ? ColorPaletteColdwaterGlimpse.goldAccentColdwaterGlimpse.opacity(0.4)
                                : Color.white.opacity(0.1),
                            lineWidth: 1
                        )
                )
        )
    }
}

#Preview {
    AchievementsViewColdwaterGlimpse(onBackColdwaterGlimpse: {})
}

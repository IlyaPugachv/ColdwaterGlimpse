import Foundation

struct AchievementDefinitionColdwaterGlimpse: Identifiable {
    let id: String
    let titleColdwaterGlimpse: String
    let descriptionColdwaterGlimpse: String

    static let catalogColdwaterGlimpse: [AchievementDefinitionColdwaterGlimpse] = [
        .init(id: "steadySwimmerColdwaterGlimpse",
              titleColdwaterGlimpse: "Steady Swimmer",
              descriptionColdwaterGlimpse: "Reach a 10-round streak in any mode."),
        .init(id: "arcticLegendColdwaterGlimpse",
              titleColdwaterGlimpse: "Arctic Legend",
              descriptionColdwaterGlimpse: "Reach a 30-round streak in any mode."),
        .init(id: "equalizerColdwaterGlimpse",
              titleColdwaterGlimpse: "Equalizer",
              descriptionColdwaterGlimpse: "Get 5 \"Equal\" answers correct in a single run (Compare mode)."),
        .init(id: "sharpEyeColdwaterGlimpse",
              titleColdwaterGlimpse: "Sharp Eye",
              descriptionColdwaterGlimpse: "Get 10 exact answers in a single run (Exact mode)."),
        .init(id: "iceGlanceColdwaterGlimpse",
              titleColdwaterGlimpse: "Ice Glance",
              descriptionColdwaterGlimpse: "Win a round when the viewing time is at its shortest setting (any mode)."),
        .init(id: "falseStartColdwaterGlimpse",
              titleColdwaterGlimpse: "False Start",
              descriptionColdwaterGlimpse: "Lose on the first round 3 times (any mode)."),
        .init(id: "almostThereColdwaterGlimpse",
              titleColdwaterGlimpse: "Almost There",
              descriptionColdwaterGlimpse: "Lose after reaching a 9-round streak.")
    ]
}

import ProjectDescription

let project = Project(
    name: "CUKBOB-iOS",
    targets: [
        .target(
            name: "CUKBOB-iOS",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.CUKBOB-iOS",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["CUKBOB-iOS/Sources/**"],
            resources: ["CUKBOB-iOS/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "CUKBOB-iOSTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.CUKBOB-iOSTests",
            infoPlist: .default,
            sources: ["CUKBOB-iOS/Tests/**"],
            resources: [],
            dependencies: [.target(name: "CUKBOB-iOS")]
        ),
    ]
)

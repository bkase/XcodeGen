// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "XcodeGen",
    products: [
        .executable(name: "XcodeGen", targets: ["XcodeGen"]),
        .library(name: "XcodeGenKit", targets: ["XcodeGenKit"]),
        .library(name: "ProjectSpec", targets: ["ProjectSpec"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/PathKit.git", .revision("a667cd3")),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "0.3.6"),
        .package(url: "https://github.com/yonaskolb/JSONUtilities.git", from: "3.3.0"),
        .package(url: "https://github.com/kylef/Spectre.git", from: "0.8.0"),
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "3.0.0"),
        .package(url: "https://github.com/xcodeswift/xcproj.git", .revision("58b0b053a5ae589c7fd6871fdda7b1729b301165"))
    ],
    targets: [
        .target(name: "XcodeGen", dependencies: [
          "XcodeGenKit",
          "Commander",
          "Rainbow",
        ]),
        .target(name: "XcodeGenKit", dependencies: [
          "ProjectSpec",
          "JSONUtilities",
          "xcproj",
          "PathKit",
        ]),
        .target(name: "ProjectSpec", dependencies: [
          "JSONUtilities",
          "xcproj",
          "Yams",
        ]),
        .testTarget(name: "XcodeGenKitTests", dependencies: [
          "XcodeGenKit",
          "Spectre"
        ])
    ]
)

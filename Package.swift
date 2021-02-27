// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Musa",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
        .package(name: "SwiftkubeClient", url: "https://github.com/swiftkube/client.git", from: "0.6.0")
    ],
    targets: [
        .target(name: "Musa", dependencies: [.target(name: "MusaCore")]),
        .target(
            name: "MusaCore",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "SwiftkubeClient", package: "SwiftkubeClient"),
            ]),
        .testTarget(
            name: "MusaCoreTests",
            dependencies: ["Musa"]),
    ]
)

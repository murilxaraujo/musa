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
        .package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: "1.1.0")
    ],
    targets: [
        .target(name: "Musa", dependencies: [.target(name: "MusaCore")]),
        .target(
            name: "MusaCore",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "MongoSwift", package: "mongo-swift-driver")
            ]),
        .testTarget(
            name: "MusaCoreTests",
            dependencies: ["Musa"]),
    ]
)

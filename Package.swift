// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RayTracer",
    products: [
        .library(
            name: "RayTracer",
            targets: ["RayTracer"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "RayTracer",
            dependencies: []
        ),
        .executableTarget(
            name: "Projectiles",
            dependencies: [
                "RayTracer",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Examples/Projectiles"
        ),
        .testTarget(
            name: "RayTracerTests",
            dependencies: ["RayTracer"]
        ),
    ]
)

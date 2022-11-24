// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RayTracer",
    products: [
        .library(
            name: "RayTracer",
            targets: ["RayTracer"]
        ),
        .executable(
            name: "Projectiles",
            targets: ["Projectiles"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RayTracer",
            dependencies: []
        ),
        .target(
            name: "Projectiles",
            dependencies: ["RayTracer"]
        ),
        .testTarget(
            name: "RayTracerTests",
            dependencies: ["RayTracer"]
        ),
    ]
)

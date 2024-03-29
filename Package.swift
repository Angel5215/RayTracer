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
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.2")
    ],
    targets: [
        .target(
            name: "RayTracer",
            dependencies: []
        ),
        .executableTarget(
            name: "projectiles",
            dependencies: [
                "RayTracer",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Examples/Projectiles"
        ),
        .executableTarget(
            name: "matrix-experiments",
            dependencies: [
                "RayTracer"
            ],
            path: "Examples/MatrixExperiments"
        ),
        .executableTarget(
            name: "matrix-transformations",
            dependencies: [
                "RayTracer",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Examples/MatrixTransformations"
        ),
        .testTarget(
            name: "RayTracerTests",
            dependencies: ["RayTracer"]
        )
    ]
)

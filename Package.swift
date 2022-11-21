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
    dependencies: [],
    targets: [
        .target(
            name: "RayTracer",
            dependencies: []
        ),
        .testTarget(
            name: "RayTracerTests",
            dependencies: ["RayTracer"]
        )
    ]
)

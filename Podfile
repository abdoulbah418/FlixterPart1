import PackageDescription

let package = Package(
    name: "Flixter Part 1 - Abdoul Bah",
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", from: "9.4.0")
    ],
    targets: [
        .target(
            name: "Flixter Part 1 - Abdoul Bah",
            dependencies: [
                .product(name: "Nuke", package: "Nuke")
            ]),
        .testTarget(
            name: "Flixter Part 1 - Abdoul BahTests",
            dependencies: ["Flixter Part 1 - Abdoul Bah"]),
    ]
)

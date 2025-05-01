// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "District",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
        .library(
            name: "Assets",
            targets: ["Assets"]),
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]
        ),
        .library(
            name: "Home",
            targets: ["Home"]),
        .library(
            name: "Search",
            targets: ["Search"]),
        .library(
            name: "DirectChat",
            targets: ["DirectChat"]),
        .library(
            name: "Store",
            targets: ["Store"]),
        .library(
            name: "Profile",
            targets: ["Profile"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                "Assets",
                "Home",
                "Search",
                "DirectChat",
                "Store",
                "Profile"
            ],
            path: "Packages/DesignSystem/Sources"
        ),
        .target(
            name: "Assets",
            path: "Packages/Assets/Sources",
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "Coordinator",
            path: "Packages/Coordinator/Sources"
        ),
        .target(
            name: "Home",
            path: "Packages/Home/Sources"
        ),
        .target(
            name: "Search",
            path: "Packages/Search/Sources"
        ),
        .target(
            name: "DirectChat",
            path: "Packages/DirectChat/Sources"
        ),
        .target(
            name: "Store",
            path: "Packages/Store/Sources"
        ),
        .target(
            name: "Profile",
            path: "Packages/Profile/Sources"
        )
    ]
)

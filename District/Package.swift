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
            targets: ["Profile"]),
        .library(
            name: "Notification",
            targets: ["Notification"]),
        .library(
            name: "ProductDetails",
            targets: ["ProductDetails"]),
        .library(
            name: "Cart",
            targets: ["Cart"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0"),
        .package(url: "https://github.com/pointfreeco/swift-perception.git", from: "1.3.5")
    ],
    targets: [
        .target(
            name: "DesignSystem",
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
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/Home/Sources"
        ),
        .target(
            name: "Search",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/Search/Sources"
        ),
        .target(
            name: "DirectChat",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/DirectChat/Sources"
        ),
        .target(
            name: "Store",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/Store/Sources"
        ),
        .target(
            name: "Profile",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/Profile/Sources"
        ),
        .target(
            name: "Notification",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/Notification/Sources"
        ),
        .target(
            name: "ProductDetails",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/ProductDetails/Sources"
        ),
        .target(
            name: "Cart",
            dependencies: [
                .product(name: "Perception", package: "swift-perception"),
                .target(name: "DesignSystem"),
                .target(name: "Assets")
            ],
            path: "Packages/Cart/Sources"
        )
    ]
)

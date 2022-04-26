// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "NRKSans",
  platforms: [.tvOS(.v13), .iOS(.v10)],
  products: [
    .library(
      name: "NRKSans",
      type: .static,
      targets: ["NRKSans"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "NRKSans",
      dependencies: [],
      path: "ios"
    ),
  ]
)


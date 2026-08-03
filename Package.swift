// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
  name: "TagCommander SDK V5",
  platforms: [ .iOS(.v12), .tvOS(.v12)],
  products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.

        .library(
            name: "TCCore",
            targets: ["TCCore"]),
        .library(
            name: "TCConsent",
            targets: ["TCConsent"]),
        .library(
            name: "TCPartners",
            targets: ["TCPartners"]),
        .library(
            name: "TCServerSide_noIDFA",
            targets: ["TCServerSide_noIDFA"]),
        .library(
            name: "TCServerSide",
            targets: ["TCServerSide"]),
        .library(
            name: "TCIAB",
            targets: ["TCIAB"]),  ],
  dependencies: [
  ],
  targets: [

        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.1/TCCore.zip",
            checksum: "13582aa6b01d3d17ccd74ae64362d5deef2af1e2f9d5e4bf0b171dbbc9a0fc72"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.1/TCConsent.zip",
            checksum: "f9e2b0b0767c12b3ccf071dc2f342d79d48d1006e130455e592cca04f67184ed"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.1/TCPartners.zip",
            checksum: "a077e8beedaa8c8cd97c5add63eb64593d0f724fc6df23a88d7fa016856b1e1a"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.1/TCServerSide_noIDFA.zip",
            checksum: "3c8e3d0e047168b8929205f3f9777d7096431a56de89ae485269493416265dfd"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.1/TCServerSide.zip",
            checksum: "5f24aa0d403b2c3ec6270654bccfaf84a0f3933bc0e36371adbed8bc928ea2cc"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.1/TCIAB.zip",
            checksum: "83164b61d612ee071d4ec125f425984e0d3dc56dfd334ce2fcf8fc6d833ce1db"
        ),  ]
)

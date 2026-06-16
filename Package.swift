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
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.0/TCCore.zip",
            checksum: "edc407d2ed196818ca7afa7ff3fa8b44d8c15d2c43de4235c36e1d71714be4c0"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.0/TCConsent.zip",
            checksum: "953a60ca29708d50e72000c1c2dbf78f00d65de8ec4ced5036c6c6fa2dd695d3"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.0/TCPartners.zip",
            checksum: "2560aba7cf8a2ee5441e544b8f2b55dc103bc4fb028836a4d933c71936421d88"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.0/TCServerSide_noIDFA.zip",
            checksum: "e0d3d3237509a2b076a2541b126de67b697c7cd21f2f2caa3bee03c6cb81f507"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.0/TCServerSide.zip",
            checksum: "1bfaf90b4c273edce4db170c91b3002b1f7c84ce9be7fb4c55f3a8f7b378dd44"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.5.0/TCIAB.zip",
            checksum: "abd1edf370f5a6829eb325965bf4d26a471d4bf8938a41f2ed8529000b27d618"
        ),  ]
)

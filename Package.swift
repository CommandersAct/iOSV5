// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
  name: "TagCommander SDK V5",
  platforms: [ .iOS(.v12), .tvOS(.v12)],
  products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.

        .library(
            name: "TCServerSide_noIDFA",
            targets: ["TCServerSide_noIDFA"]),
        .library(
            name: "TCCore",
            targets: ["TCCore"]),
        .library(
            name: "TCServerSide",
            targets: ["TCServerSide"]),
        .library(
            name: "TCIAB",
            targets: ["TCIAB"]),
        .library(
            name: "TCConsent",
            targets: ["TCConsent"]),
        .library(
            name: "TCPartners",
            targets: ["TCPartners"]),  ],
  dependencies: [
  ],
  targets: [

        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.11/TCServerSide/5/4/3/TCServerSide_noIDFA.zip",
            checksum: "17438e5de4bb85e7a45a5dbcf0748d6cc7490f7cc0c8654fe698d8055423fa4c"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.11/TCCore/5/4/0/TCCore.zip",
            checksum: "abe3dfefa19422d61580e0bb055aaadb7a412211e6051a58b63a4fd74ded3727"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.11/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "1dc9e3f0ff0820b5c0af681c3208cc2fff7bb5da5a0888ea73c3e67cdb2a6ae2"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.11/TCIAB/5/1/1/TCIAB.zip",
            checksum: "ca70c0568bdc98359e1a5f61a17274dab888bd64e3973ea15a7e7cc8e26f400f"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.11/TCConsent/5/3/4/TCConsent.zip",
            checksum: "fba1d5e614e128f811a14127a595f26e02a48233229c4647a80f2dd2d6919329"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.11/TCPartners/5/0/3/TCPartners.zip",
            checksum: "5ae65c28d7786bf322fec0b1d2d94e19877cc5ff2b605453c0ab59cea1904f00"
        ),  ]
)

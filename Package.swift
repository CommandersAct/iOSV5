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
            name: "TCConsent_IAB",
            targets: ["TCConsent_IAB"]),
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
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/4/0/TCServerSide_noIDFA.zip",
            checksum: "3f7b76ab74b1769807b211dc924973b94722e9eed667c10e174158e5819495f6"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/8/TCConsent_IAB.zip",
            checksum: "66d673d42d2e2ab79b3ab7d891836db58fc060c75083285a05c828bd32093839"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/3/0/TCCore.zip",
            checksum: "f19a443a130844825a7e86155caf77297982e5f21bdae1b3cddadbb2a66e9dac"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/4/0/TCServerSide.zip",
            checksum: "1a8e1445231a876cfc2935979ef66001727a1d7ceb64aad0ffd7f9a272a363a2"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/1/TCIAB.zip",
            checksum: "8840a602b36d91ff55df4bf0da0d4f559904b86025eb39c8a4b4772dff14555f"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/8/TCConsent.zip",
            checksum: "7d3669445811a0ff02cf364835a3c119b59f418114604b34633ab3a11d8d7968"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/2/TCPartners.zip",
            checksum: "2c643f52365f0b77a7aefbd9d73ab265a3443dda9fa9a09ff7d718035223184c"
        ),  ]
)

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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCServerSide/5/3/1/TCServerSide_noIDFA.zip",
            checksum: "984afd7f99a220cd30af2cacd9d370f91ede4afa3bc8758d44fce702d183447b"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCConsent/5/1/5/TCConsent_IAB.zip",
            checksum: "0f42892365389744842252acec8ca5ebda96413892cb4d4e7d79503ecd334c90"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCCore/5/2/2/TCCore.zip",
            checksum: "c21943d8a8055cfe7fa63806d58a4d455a8ff998ea9700f000c84206df507bd4"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCServerSide/5/3/1/TCServerSide.zip",
            checksum: "c78741e06a7d27c4a63e37202a12c61f628f7ca67cf28051b7cd79961c33fe50"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCIAB/5/0/1/TCIAB.zip",
            checksum: "6d709f893b993249571e04cc4bae59e3b554fa49ad047a85640a6937b7e6a3dd"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCConsent/5/1/5/TCConsent.zip",
            checksum: "bb0198e7699aa2f999ba38c7659ce47d6cc4aec0761ba803155b08820e64371c"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.1/TCPartners/5/0/2/TCPartners.zip",
            checksum: "227bdf62a12a43c84807a12a4f06e679f85d60661094f05b83e405f98e1acc0d"
        ),  ]
)

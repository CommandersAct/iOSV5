// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
  name: "TagCommander SDK V5",
  platforms: [ .iOS(.v12), .tvOS(.v12)],
  products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.

        .library(
            name: "TCCore-noIDFA",
            targets: ["TCCore-noIDFA"]),
        .library(
            name: "TCConsent-IAB",
            targets: ["TCConsent-IAB"]),
        .library(
            name: "TCPartners",
            targets: ["TCPartners"]),
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
            targets: ["TCConsent"]),  ],
  dependencies: [
  ],
  targets: [

        .binaryTarget(
            name: "TCCore-noIDFA",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/1/1/TCCore-noIDFA.zip",
            checksum: "04651d30a55ce25b9e5f96a0e3f58828cefcbd5688d6ed45d1aeaf1c226b693a"
        ),
        .binaryTarget(
            name: "TCConsent-IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent-IAB.zip",
            checksum: "f3a97f609cabcb31ebf046ef034e1ac5e6d73d4da259b2752095d85af2a03c37"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/0/TCPartners.zip",
            checksum: "5ddc53d2cd339e3b10397a7acdcf341504d944dd3df4e02dbf8cbad4a80bae60"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/1/1/TCCore.zip",
            checksum: "7d50f02e34505b8f5406b8151f5f13dd94ded7d690b5caa432d9b2f783662211"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/1/3/TCServerSide.zip",
            checksum: "b0d4c3841ef5689d821a8f2d662bfe6eecf877efe950236144e3b2fe3ded5b4f"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/0/TCIAB.zip",
            checksum: "54f69f96637aeea06719517b86f04f1ebca93a6d3465c67ca12e095d76260823"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent.zip",
            checksum: "6b7813b19196b967c4bfca69be4df22aca63b34ffe991106c7dab8d95a8a4adc"
        ),  ]
)

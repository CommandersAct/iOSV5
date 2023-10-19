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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCServerSide/5/4/1/TCServerSide_noIDFA.zip",
            checksum: "abb6dc3ccf1c56020165a1b666f1bc588540435961124d21b16bc7764024a115"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCConsent/5/1/9/TCConsent_IAB.zip",
            checksum: "cd41bff26acd2ecd1daae0b17b34551c1d13855a1f350ef02938440ef3616ee4"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCCore/5/3/1/TCCore.zip",
            checksum: "c848f49e9825726b6344399e044062d3bb029c3891ff25df5fd9da507275d19f"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCServerSide/5/4/1/TCServerSide.zip",
            checksum: "a725adaf3f28234dd170dbc6982bb2b765586bd188bed7cbad63a0d593862d52"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCIAB/5/0/1/TCIAB.zip",
            checksum: "db4dffde3106b693b60ec995a0a3e0145d82359020f6efc7cb31dd10701e7aeb"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCConsent/5/1/9/TCConsent.zip",
            checksum: "772ba12ea41806ecf30edb12c6f7db5993e544018ec75e54c2f65228de69a84f"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.2/TCPartners/5/0/2/TCPartners.zip",
            checksum: "cea0707f12906aeb343a2fdd68ffaee40f16c7b72c2bbcd8a7f7137d7a54c84e"
        ),  ]
)

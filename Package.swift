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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCServerSide/5/3/2/TCServerSide_noIDFA.zip",
            checksum: "886ac8298291c04c334a480840815efc2c9cf45c1b270025d64dca3ba9a14d8c"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCConsent/5/1/7/TCConsent_IAB.zip",
            checksum: "49f4748ca880489fd4e98ad930e606c3dd07da8e11fe953a7f61f4c81096bb25"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCCore/5/2/5/TCCore.zip",
            checksum: "a694425131e307654d995523227dd85ad4a2641cbef779690f3d1b2e0273b86e"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCServerSide/5/3/2/TCServerSide.zip",
            checksum: "bf93f835382cb09a9519faaabf7f982b04a9c5f4ca96a2f0fef8ea46d07d72d5"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCIAB/5/0/1/TCIAB.zip",
            checksum: "46517b70891f2198edd0014fef24bf5d9e568eaceaf9037c0f0af3e26d27f3b0"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCConsent/5/1/7/TCConsent.zip",
            checksum: "924215267e1ac11c4e393be52248fdc3c8d076a7b6d4ef6faa7aa2b8c80763dd"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.3/TCPartners/5/0/2/TCPartners.zip",
            checksum: "f42dcfb226bb8e7d15a933e0149cdf205c5f616089a24914aa89c46e6877443e"
        ),  ]
)

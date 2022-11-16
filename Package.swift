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
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/2/0/TCCore-noIDFA.zip",
            checksum: "ef3b47d42adc42373a6dfe36db49ff23dc43a949b0dcbf5f3439e75a48ddd7ec"
        ),
        .binaryTarget(
            name: "TCConsent-IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent-IAB.zip",
            checksum: "28101020cd19be58de491c24745433d18da14318d48b7f88b24a8df588070989"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/0/TCPartners.zip",
            checksum: "d481a29eb2b23ec124fdbc46cc5a281272eaed83c4762b91177bf3e78d322178"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/2/0/TCCore.zip",
            checksum: "451606a6b0cdaa089bcc4bc57076dfa11a95c31ca9817aae3bc53e5a957b8470"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/2/0/TCServerSide.zip",
            checksum: "a8dbb6ccd5f48b0fee154f4c3a3a41b6a11a66a8c6879711b98b3ab11249d17e"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/0/TCIAB.zip",
            checksum: "60fc5a2b83d4cd448fc40106e18435454cb2ea3d9d1d48fc0ebd57ad398b9222"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent.zip",
            checksum: "ae6fde0131622ba2b4ebccff7cd14a9c323cc5a78b4f1b2048ee0f3b01c7e445"
        ),  ]
)

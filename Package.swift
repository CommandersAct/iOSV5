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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCServerSide/5/4/4/TCServerSide_noIDFA.zip",
            checksum: "31f7dd03f725e89b52b5eca18f9516cda0fb9487c0c11410b40f878a8c1d6ed1"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCCore/5/4/1/TCCore.zip",
            checksum: "1f4ee96b0567556f9cf689a9c0a8a54ed1273483934d5eb1f59e948fc408d128"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCServerSide/5/4/4/TCServerSide.zip",
            checksum: "1e75ab381564e725f3e468f8975041dd9a113128e9e79a2bf087a1e9d48965b1"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCIAB/5/1/1/TCIAB.zip",
            checksum: "fd6fbd7d0e101c37c6347a3cfea25a83dbb368f99730126c33aa9593891ee0e1"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCConsent/5/3/5/TCConsent.zip",
            checksum: "45b424dc2fd87c4a70e122c3e6149247aeae9179b2373f37b1c8c8ad17bc0988"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCPartners/5/0/3/TCPartners.zip",
            checksum: "80233842617986e6c388810b4fc439bb50dd1ca0e51a4e4b96e1c997894d6ac5"
        ),  ]
)

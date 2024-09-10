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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCServerSide/5/4/3/TCServerSide_noIDFA.zip",
            checksum: "99e6bdc18f3a6c93086b17598e08d69e9c640fcaf8005a62660e09b1e944da6a"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCCore/5/4/0/TCCore.zip",
            checksum: "512703209ce284440bee76787342f69961f97b68174eb7b6c5a69557ac983543"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "f12c09680ce9872f9c2c1437dcb25e19c59b6835864249339455ffa7dca3836e"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCIAB/5/1/1/TCIAB.zip",
            checksum: "aea37475c3498f9c4ea6e9640a9159ec2bc2fafc7bdb2d76c532640ba0d1ca3f"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCConsent/5/3/3/TCConsent.zip",
            checksum: "be3bcbef6f016f130aded79bde2eb6911abdf16ee2959f8f9f391df77b8d7cf9"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCPartners/5/0/3/TCPartners.zip",
            checksum: "7c2b84a5898624f65dc7dc9fbbdcf1e7e790aceb34d8496ffa698b4b72557ca1"
        ),  ]
)

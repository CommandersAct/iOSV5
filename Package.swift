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
            url: "https://github.com/commandersact/iOSV5/raw/5.4.19/TCCore/5/4/5/TCCore.zip",
            checksum: "5d76d9b3b6f4bd811a50f9eb67da6f8ca0c4362a11aa67545649df962782f7e1"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.19/TCConsent/5/3/8/TCConsent.zip",
            checksum: "a2f666b1b1bf653a1ec5c4a386cf3d127bdd6aee4f5db239b20ac380b84f1e0d"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.19/TCPartners/5/0/4/TCPartners.zip",
            checksum: "623d410eb874232000bb5d8cfaeb393f7326a07aeefaa480fec6a14ea23b3284"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.19/TCServerSide/5/4/7/TCServerSide_noIDFA.zip",
            checksum: "a3312e9072cc437727a0bfa47d4a82f2edf98eaac410546f5d929e4f279609ae"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.19/TCServerSide/5/4/7/TCServerSide.zip",
            checksum: "5b3389a448f9ccfe8f9cb9750c951a8c609776260bc5e25103820ee93b61dbc4"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.19/TCIAB/5/2/0/TCIAB.zip",
            checksum: "d9951c49117c86afa4d3c6d83f0a88b8669b6df6743c4de172462158ccb21c1d"
        ),  ]
)

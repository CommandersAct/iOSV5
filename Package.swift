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
            url: "https://github.com/commandersact/iOSV5/raw/5.4.18/TCCore/5/4/4/TCCore.zip",
            checksum: "a7f839746944c77238397cf9068f146cebd72a07c4b03f8a7f87d1811fbe1895"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.18/TCConsent/5/3/8/TCConsent.zip",
            checksum: "16c99609fbae307fb6105477438b063052a9aef82990a28c48c29170e3286b26"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.18/TCPartners/5/0/4/TCPartners.zip",
            checksum: "0d768c4c27795543cb13103da3f153cd4e4fa607cb34eb2a854f348572cde8d0"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.18/TCServerSide/5/4/6/TCServerSide_noIDFA.zip",
            checksum: "1f5ae41d9a08203143286011550806e95bd76675dc88bd0279e21fcb5d85ad4d"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.18/TCServerSide/5/4/6/TCServerSide.zip",
            checksum: "b4579a0c4558df63b0f0eb9e1ef05fe23e6130c78f47b818e3cea16b5c95f64d"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.18/TCIAB/5/2/0/TCIAB.zip",
            checksum: "a5f51912c07d127c91ac43f0be41bc1a49b26729601b986962c64b5e7f585a2f"
        ),  ]
)

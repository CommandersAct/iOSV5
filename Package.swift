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
            url: "https://github.com/commandersact/iOSV5/raw/5.4.17/TCCore/5/4/3/TCCore.zip",
            checksum: "0bf68249c705a30a2e951b05b4504db5ccb160ff7b8564ef03685a447a40f668"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.17/TCConsent/5/3/7/TCConsent.zip",
            checksum: "e653347c44c493a316ed7a54491752656adfcaf2f599137d3b4d0d89d7285eea"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.17/TCPartners/5/0/4/TCPartners.zip",
            checksum: "8729356076f0561c431024f91134291ca1220687b1049702e36bdbe0ff0b2ba6"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.17/TCServerSide/5/4/5/TCServerSide_noIDFA.zip",
            checksum: "ec58bd6b24e292a81f8cc3cde208b86164b86a4a352821e2729a2e72359c09c2"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.17/TCServerSide/5/4/5/TCServerSide.zip",
            checksum: "ff2cd660134bd88b979fc986d2b16036343b6ea25c16f24283a8c985dfb5f12c"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.17/TCIAB/5/2/0/TCIAB.zip",
            checksum: "d47f33c0132bda4de2ea72e3f62fd20d7850a830a659a015d938ad86065634c9"
        ),  ]
)

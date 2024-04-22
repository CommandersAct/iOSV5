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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.7/TCServerSide/5/4/3/TCServerSide_noIDFA.zip",
            checksum: "5df511f677f21f76784e09e5d673a5dcb41ae3ef8134ee8df899b7100ba30478"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.7/TCCore/5/4/0/TCCore.zip",
            checksum: "452dd144c306acca126b578d5a4265de9f9fa74d2db086b7c5ff09f0efc8e137"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.7/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "598194548318ee22b522b7b8cca8627d164d846126c3b56e7df666b20562a211"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.7/TCIAB/5/1/0/TCIAB.zip",
            checksum: "4d8499c0a5a083ef4e7996e7c33dc52c0c9935bd74f01465bec05842f785a112"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.7/TCConsent/5/3/0/TCConsent.zip",
            checksum: "9e1d628a84bd52c8e499f4acc5a04d87f0152be63d36f040cd83b77978a68941"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.7/TCPartners/5/0/2/TCPartners.zip",
            checksum: "a90a951b69d505dc61e73f403522acf48d5365b79542dd5103c43f1910c520a5"
        ),  ]
)

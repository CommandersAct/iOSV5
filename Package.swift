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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.9/TCServerSide/5/4/3/TCServerSide_noIDFA.zip",
            checksum: "27ae82f6a85c97756390ff7875000968066b60cf6791305022ddadf86d56a7f7"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.9/TCCore/5/4/0/TCCore.zip",
            checksum: "dbd9819bcc35df6d68b68083899de6591fd0403435cc5d72a437cf5fbafed1b3"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.9/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "488371087b6af3d17b5ffe473c7331c4937d272d092ddee2eae2888e673f7b34"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.9/TCIAB/5/1/0/TCIAB.zip",
            checksum: "1f038c2362f00e1837d77ef75c61e4db84379aa8a53ec817146b4b8eba15994c"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.9/TCConsent/5/3/2/TCConsent.zip",
            checksum: "cbb4f862a2a17a6d36c25f932518b3a6a336f8181945a034ba69277c373fa57c"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.9/TCPartners/5/0/3/TCPartners.zip",
            checksum: "a232b6f7d9384aca0fb9d992fee344dede7e3ca95d167dd3425840c4442bfd22"
        ),  ]
)

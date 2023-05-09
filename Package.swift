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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCServerSide/5/3/2/TCServerSide_noIDFA.zip",
            checksum: "6fad671118fc105385f60c0af890320b86efcb50a80941592b12bebb60bdf704"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCConsent/5/1/5/TCConsent_IAB.zip",
            checksum: "9fb3d7aa8b1c9f3597d2ab1a1523c55c1427f4fc9c3ec34136f63c96c77a4b66"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCCore/5/2/3/TCCore.zip",
            checksum: "eb7d887f44c64f79b01940e18604c9f50c2898d3deb534f7cb40dcbbf67e36a1"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCServerSide/5/3/2/TCServerSide.zip",
            checksum: "fba409274df5c0a6e2a435133096511de17a4284f226c1f5dfe8f548a924c6b8"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCIAB/5/0/1/TCIAB.zip",
            checksum: "b4486377885420bfe5f099af8a9014afea092093a68a855bc04e306acede2350"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCConsent/5/1/5/TCConsent.zip",
            checksum: "0f817c30367d44f7f4832d0cfad7d6b6da420052358ab915dde415fc26f7c852"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.3.2/TCPartners/5/0/2/TCPartners.zip",
            checksum: "465b3dedfed23b09ca8a8d7166ef99a698e7b183d9b0aff948623d79ed7b7644"
        ),  ]
)

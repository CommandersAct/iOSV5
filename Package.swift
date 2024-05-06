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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCServerSide/5/4/3/TCServerSide_noIDFA.zip",
            checksum: "4e76d7beba66a43b930f627d912e78832cb0b9bb1fac331757180662cd494b9a"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCCore/5/4/0/TCCore.zip",
            checksum: "318bccdf94c8fe962681d09d4cced572fa3b6b80cef118f98f03fdd1e2625200"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "24cfec5bfaaadd7479da5d2795a7ac47ad5e5256974fdc8be0a395fb3f392cc5"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCIAB/5/1/0/TCIAB.zip",
            checksum: "7224fa6f3fcab4390c14625049c7bbaf3a7da48330c2168b4715b11c7b1c4544"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCConsent/5/3/1/TCConsent.zip",
            checksum: "21760ec1420beb23edb1b076e33da41db3ce246d3d03dbbf0e973ad6d8bdd247"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCPartners/5/0/2/TCPartners.zip",
            checksum: "25bc864f11bdeed6adce18323fba77717dc117511d6a9cce3c8fb019121bd572"
        ),  ]
)

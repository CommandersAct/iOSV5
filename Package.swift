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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCServerSide/5/4/3/TCServerSide_noIDFA.zip",
            checksum: "d647b64cbfcadb4ecfd2b12b5fce6797b1d5571d592b733e56231949310ffdf1"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCConsent/5/2/1/TCConsent_IAB.zip",
            checksum: "ebaadc96bdf7be52141d2ccffc76682f710c7a50a3afd75fc92274a1e110a3c6"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCCore/5/3/4/TCCore.zip",
            checksum: "002e76eb44bef9ba3239bf0623b530cd0cc7c7be437d47fb3344531f6c4d25f3"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "873a01b6c807c3ea1396ffade803e35669af08fa35795992d81e9e479c0f1706"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCIAB/5/0/2/TCIAB.zip",
            checksum: "4758bf5431c11ddcdaa422d06910f429860acfba29c0a547233a494d59ba4d96"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCConsent/5/2/1/TCConsent.zip",
            checksum: "e40379b3ffbf5d29571d7df4c621710768a69fa3ce40bdb1bb9cf14d1bba2559"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.6/TCPartners/5/0/2/TCPartners.zip",
            checksum: "f64a678fd477a55203d6a9cacd7297af4fd40f2d4468e592f06b8948c6015781"
        ),  ]
)

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
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/2/1/TCServerSide_noIDFA.zip",
            checksum: "6ad48190f3c556979a0e1e423c9428c41fb48f44aa02080cf4233dc8b5ae98f7"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/3/TCConsent_IAB.zip",
            checksum: "ed026f7fbf2f299ef35ce3d1b80df04e576e41bd8c0eed0283fce8609fc99259"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/2/1/TCCore.zip",
            checksum: "3e4dbf578aec0fd955d7a17f7adf2d168ff227ade67ca4ffe84464d8ffe0dc31"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/2/1/TCServerSide.zip",
            checksum: "d5839f4a943ff80c5198d9ffdd155a2fc0e52859a22a4faf72dd34f10a754f58"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/1/TCIAB.zip",
            checksum: "fab7b1b6d4fcc87457763c172fa28c4d5f26f1e6fed3248ee73729b280cb969d"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/3/TCConsent.zip",
            checksum: "92ce20781769cfb523ad8e06a107d7e7bd739412598ae099ffe1a50905b52c7f"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/1/TCPartners.zip",
            checksum: "b8bb9adb15aaf44a5f1406584c05396f2bad7bc481941d38b9f0a583efd58b08"
        ),  ]
)

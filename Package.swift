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
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/3/1/TCServerSide_noIDFA.zip",
            checksum: "a0d2bf9db3705899bf49f46487441948301c08ef40613546d548fde2d4b9d3b6"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/5/TCConsent_IAB.zip",
            checksum: "75ad7ba62d664584cf485342cdaa655623a8c19aea50e9caf9cc331d295ff9c8"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/2/2/TCCore.zip",
            checksum: "fc117432e085f517958d5360956678de2d7f0ee3300a00e2a0d7e1351800f71e"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/3/1/TCServerSide.zip",
            checksum: "e0ee1d9d3a959d736d1c196a134742e7a4884e67775c8c23e4067fc5e418cf48"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/1/TCIAB.zip",
            checksum: "0b3a8cf4fbe99a3f5ff33da65eaf1a824d152cba957a424cd6626c884be308ea"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/5/TCConsent.zip",
            checksum: "1fb0cfc6b903606c06820527bc35e2c30938e9ae7d2dbb5753d21e624f32e685"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/2/TCPartners.zip",
            checksum: "de60f7276cd527b180ffb23270bbdc19ceb6df92860d656c33a370a73e4e6726"
        ),  ]
)

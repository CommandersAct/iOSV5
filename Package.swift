// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
  name: "TagCommander SDK V5",
  platforms: [ .iOS(.v12), .tvOS(.v12)],
  products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.

        .library(
            name: "TCCore-noIDFA",
            targets: ["TCCore-noIDFA"]),
        .library(
            name: "TCConsent-IAB",
            targets: ["TCConsent-IAB"]),
        .library(
            name: "TCPartners",
            targets: ["TCPartners"]),
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
            targets: ["TCConsent"]),  ],
  dependencies: [
  ],
  targets: [

        .binaryTarget(
            name: "TCCore-noIDFA",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/1/1/TCCore-noIDFA.zip",
            checksum: "1b80ea3c6e81ac1d60b78633f8709584b0107b7a94aebcab2232386e269dbca6"
        ),
        .binaryTarget(
            name: "TCConsent-IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent-IAB.zip",
            checksum: "272fdace8376d027fd3f972a9abc5ff6c68bb56406387a257b2246ff3ac88b56"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/0/TCPartners.zip",
            checksum: "0172aadf67b11302d279fb2599ecad2824ea724c933551576046d5a2e092d9a4"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/1/1/TCCore.zip",
            checksum: "6c7834274750f005ed81f8f73ac4b0cda802bf5fe784b7bde18d5bf28c1ac19c"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/1/3/TCServerSide.zip",
            checksum: "1bbfc87481618e6c5915ca12b8395ef914b68ebd1125cf85c109d4cd0a0bc9cc"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/0/TCIAB.zip",
            checksum: "0eea4909c060bb1f8f346c1251bf8e3b61a2453ffd9e8480b27e935e927f1462"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent.zip",
            checksum: "d1e49fa2d300c1f0bfedade33397b90e37b46d8335a1f629741c58c7079313c3"
        ),  ]
)

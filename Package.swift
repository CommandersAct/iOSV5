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
            checksum: "6f6a16457d2c0bb5069dff55bc9bcc2f978be4b2926f6167bd5898957d3854c4"
        ),
        .binaryTarget(
            name: "TCConsent-IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent-IAB.zip",
            checksum: "ed4a07b14bba66b7171b05aa777eca71e7c4b7509ae7282b97fb6858e3aa0f65"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/0/TCPartners.zip",
            checksum: "d194e00b9bad9c983d4089414d5c28955c0c804203a0d86abac8ec984c873adc"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/1/1/TCCore.zip",
            checksum: "889d541c2beea351170b08fcfb8b6933094fbaf218ec847d8835ea228a23e6de"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/1/3/TCServerSide.zip",
            checksum: "21f57dc0c6411121f9d3e603a3bbcf686bda3901ce13b7ffd0fafc6780141536"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/0/TCIAB.zip",
            checksum: "d1e575637c8ae30cb33d703ef97b6dece64158b6bd75c8b3fd1ab351840dba5b"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent.zip",
            checksum: "e0e4f3a89c524fa26809c98d72873833201ef84bbc9c00b66fc0739a1168328c"
        ),  ]
)

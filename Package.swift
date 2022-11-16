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
            checksum: "886ff84a66752c2e0c872167c66556a9434d0038146ed33125d7133c357a8662"
        ),
        .binaryTarget(
            name: "TCConsent-IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent-IAB.zip",
            checksum: "bde580728e93d7f62eac14ef4c1aa6969b6737e988b0e8c208c690cff630f493"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/0/TCPartners.zip",
            checksum: "5ec55e2ca0c7560a74364f14dc5e35b243856505cb02d9f786a35cd251bb35fd"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/1/1/TCCore.zip",
            checksum: "571a0dfeddd1d5e5862a424b46f8a36dc5ad2a8dec2de1f106a0c19b28ad0895"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/1/3/TCServerSide.zip",
            checksum: "830462a065f1dba0326de3d1bf776b51e775ecc31bd501d4d8bc29bcadd68a82"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/0/TCIAB.zip",
            checksum: "24aef6d7141b35b6655d6295f68810786a8c22162407161b78ded4148f8f084a"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/2/TCConsent.zip",
            checksum: "d4ddeede3c94c2a3e4c1850d2f7366371593b72fb8e6c106f232789fa7a47433"
        ),  ]
)

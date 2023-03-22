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
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/3/0/TCServerSide_noIDFA.zip",
            checksum: "e03008e758d7fa110822dbd5297741180fadaa4b79acc20d0429d1b7fb57a802"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/4/TCConsent_IAB.zip",
            checksum: "f5e7a02761242224bb0c83b4e1a497cc39228ba12add4b75b35efba66be653a5"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCCore/5/2/2/TCCore.zip",
            checksum: "33beae92d1fe47f1fa65272687daef7520f6145a8e499f23cf7d4e3b884d62cd"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCServerSide/5/3/0/TCServerSide.zip",
            checksum: "742a5b462505f8261161d9307bf0959a7413af7b78bf52334a5be3effb65a5cc"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCIAB/5/0/1/TCIAB.zip",
            checksum: "9bb5498e7572c5fe44b217a5b4110189000a18e9831aafbdf7a0bdb34a36e459"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCConsent/5/1/4/TCConsent.zip",
            checksum: "a41ae14f9a3b78edd20e5d5fba1f7abce8fe41e4529f99fc7273de9b57629e97"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/master/TCPartners/5/0/1/TCPartners.zip",
            checksum: "92d22dd3eff72dd6019d1cdf8907ab15ade6a3aaadf74d3498b34c9dea992d32"
        ),  ]
)

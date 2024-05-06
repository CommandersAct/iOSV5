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
            checksum: "af9a72f77f372ab9fbbeb11329aedd6c88c1e32eddd20ca90276ea0fb3a2b3f9"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCCore/5/4/0/TCCore.zip",
            checksum: "4d0e63181eb031ea054462cc271c32116500f9f42375e616b3c6e5d6e9ad6121"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCServerSide/5/4/3/TCServerSide.zip",
            checksum: "9369f1d240e4a7b436c723aac4c58a86a45c29aa3affde1d60655b9c49ec0727"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCIAB/5/1/0/TCIAB.zip",
            checksum: "43bd6ded16b4be768bdc8568a05fcc88a3f4e35533373cc81619b47870f2eab7"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCConsent/5/3/1/TCConsent.zip",
            checksum: "13ecf7aa7b0dfba7010cbac159d7e5239faa853742e4fd9e4849a3ea91a4572b"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.8/TCPartners/5/0/2/TCPartners.zip",
            checksum: "def3a327955c7ad0aa9ec4128266a2f8a8d9cbb8d4565eab47ccedf7f881ba4b"
        ),  ]
)

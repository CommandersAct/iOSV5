// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
  name: "TagCommander SDK V5",
  platforms: [ .iOS(.v12), .tvOS(.v12)],
  products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.

        .library(
            name: "TCCore",
            targets: ["TCCore"]),
        .library(
            name: "TCConsent",
            targets: ["TCConsent"]),
        .library(
            name: "TCPartners",
            targets: ["TCPartners"]),
        .library(
            name: "TCServerSide_noIDFA",
            targets: ["TCServerSide_noIDFA"]),
        .library(
            name: "TCServerSide",
            targets: ["TCServerSide"]),
        .library(
            name: "TCIAB",
            targets: ["TCIAB"]),  ],
  dependencies: [
  ],
  targets: [

        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.16/TCCore/5/4/2/TCCore.zip",
            checksum: "c1ef581cdb733ab3105710300ee466d128e08d790d6c53bd304e5e81368cde16"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.16/TCConsent/5/3/6/TCConsent.zip",
            checksum: "ef2391acbd29f41a1cf3c11d13de409de03b8fbbf50de3377c2c41d8268b4e23"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.16/TCPartners/5/0/4/TCPartners.zip",
            checksum: "952d0c9d0ef579edda2cfcf252b87ee392a1cd1f51ebcb172d4212e338f05fbb"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.16/TCServerSide/5/4/5/TCServerSide_noIDFA.zip",
            checksum: "22e7dd7de2e5ffd5c3a3fcda62c2cf7adc341a2d192724227fb5d91f9ca5f126"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.16/TCServerSide/5/4/5/TCServerSide.zip",
            checksum: "e88497c8a6e7199b083836bf993184375195cdcb711de92c3c3654ab92d6ab97"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/raw/5.4.16/TCIAB/5/1/2/TCIAB.zip",
            checksum: "8a376e877e8433df7aa1b86de4fc9ffa70e9906adb2059e29851bba2fbaa0257"
        ),  ]
)

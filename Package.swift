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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCServerSide/5/4/2/TCServerSide_noIDFA.zip",
            checksum: "43550ba15aeca4b72ca5b6b9bb880746ad56e5dd84b5d56f4f0b775579e17c0a"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCConsent/5/1/10/TCConsent_IAB.zip",
            checksum: "fc0afec7f7b9bf2af2e673a02b7e2e5938d4c9d763e59c44ac320ae5c6cf2735"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCCore/5/3/2/TCCore.zip",
            checksum: "9efc10d5178b291fe287b9046a4186b4f800678993e64cd21f7bc5863680dd46"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCServerSide/5/4/2/TCServerSide.zip",
            checksum: "f21a1bd141592401350ce9a3aa4fc5260302cb90a56d4991cc063f96ded82e5b"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCIAB/5/0/1/TCIAB.zip",
            checksum: "ae31e097edebd9244af3cc164fbc4a1e2eb65ccbd7990c86237de8978ec03e03"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCConsent/5/1/10/TCConsent.zip",
            checksum: "6a774961469882396c6930630e9a0f70b4b00725a89c7475dd77025ca82b10a5"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.3/TCPartners/5/0/2/TCPartners.zip",
            checksum: "ea8eeb99c8f95da5ee3addf3c02c5e37669036f61e7bc2c9c13a9165c6c93b48"
        ),  ]
)

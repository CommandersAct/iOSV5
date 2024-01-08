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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCServerSide/5/4/2/TCServerSide_noIDFA.zip",
            checksum: "5d4a290ebc2fa1403b0b85a6968c06976c7e54970dfb1ded2036e664991ae89e"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCConsent/5/1/11/TCConsent_IAB.zip",
            checksum: "0d6cefc90fae8121343c592cf106f17def632d4eb4721a7c948e6d21b18b814e"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCCore/5/3/2/TCCore.zip",
            checksum: "060dad8081496633df7441aa3a4b0bdefa32c8b913f223a7b459a7e0c3cd6a95"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCServerSide/5/4/2/TCServerSide.zip",
            checksum: "b1da49550c83212f94e22a628db82a1de85728f49393478ae8f744d41fc8ae6f"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCIAB/5/0/1/TCIAB.zip",
            checksum: "c555025218369909ab51d3032f9af8b6bd53ee7ab12a146c19fed44f072dab35"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCConsent/5/1/11/TCConsent.zip",
            checksum: "1c4cf45bceeb9413be54a975203870354479fee4c7868bf2dadb0b1790e819f3"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.4/TCPartners/5/0/2/TCPartners.zip",
            checksum: "dac206b53c02879ed5e04665bbd09545fda1a0449d5e16f80fb3f096e483a851"
        ),  ]
)

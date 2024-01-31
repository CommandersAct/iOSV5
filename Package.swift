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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCServerSide/5/4/2/TCServerSide_noIDFA.zip",
            checksum: "4ef326890d16535d103d3ac8a25958a33f6e8542483d02455c611ae611c7e384"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCConsent/5/2/0/TCConsent_IAB.zip",
            checksum: "8cc2f58c519a6cefe28195555039de63e72130eff17be5c4e8005830ea4e5e48"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCCore/5/3/3/TCCore.zip",
            checksum: "08d33f842a0d19f98d8ba8f9df375b7f38d452dd780c1545584fb72b407320cb"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCServerSide/5/4/2/TCServerSide.zip",
            checksum: "6b3c3be692d4520f747b32ba2ec9b2c60dab6962eb589658ccd9fd13449552ec"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCIAB/5/0/1/TCIAB.zip",
            checksum: "e8815f126c6e1f40fc2379573389880cb0481f2716e4528f94c5835872ce3a1c"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCConsent/5/2/0/TCConsent.zip",
            checksum: "d55b6ece6f79aa95b4441f3371cca4a9b02a309f7a66a6067177751942a8e482"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCPartners/5/0/2/TCPartners.zip",
            checksum: "fdcad010b6126f25b291add097280539bb4ab8179a5f8764d7259de3e65e9b12"
        ),  ]
)

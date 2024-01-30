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
            checksum: "5c1648350138e7b0754cca846e2d032384fe57df70f9de91da6c82b46e2e3761"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCConsent/5/2/0/TCConsent_IAB.zip",
            checksum: "21a56e54f33ea5116b0067b6d73cc56625f61d103df9ad061c94692f6b37a640"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCCore/5/3/3/TCCore.zip",
            checksum: "2fc7f9e6813d7ad2ac2ad328c1fb00ade2c9a49fa50e40d31418d41f6f16c7d2"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCServerSide/5/4/2/TCServerSide.zip",
            checksum: "d4349b6510c12acca1a37ff3ba63a78bae37740dbdd29465f5671ced38f4f4f7"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCIAB/5/0/1/TCIAB.zip",
            checksum: "bf0629b0baeca03bbd8532240d04137087d93070f97abf4d1d78bab08a43e144"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCConsent/5/2/0/TCConsent.zip",
            checksum: "106abe7f62d9dc179e445ff62afc77d832566f23c66101f27f553a906db04635"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.5/TCPartners/5/0/2/TCPartners.zip",
            checksum: "1993554090c3dc959f698b17bb15174056cbe0646454d7c3b25a98c3c7b67251"
        ),  ]
)

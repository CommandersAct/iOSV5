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
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCServerSide/5/4/0/TCServerSide_noIDFA.zip",
            checksum: "5fa9a03f7090a791d2d82d1631d7dadad4c11da3d9243ec29fbe5e620d92bf6e"
        ),
        .binaryTarget(
            name: "TCConsent_IAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCConsent/5/1/8/TCConsent_IAB.zip",
            checksum: "56130e4a14e6f2cc6f9173be283dc629a2a1cae0a435afb33c624ba77992c4a1"
        ),
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCCore/5/3/0/TCCore.zip",
            checksum: "024ea488cb2618727c4cded302bd057f5d063d7a2aaa71c9dc96ea57652a1d28"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCServerSide/5/4/0/TCServerSide.zip",
            checksum: "09c91612ddb3de1293be3067ab9e4a73d11012059304ed80c27ec769cf8cc981"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCIAB/5/0/1/TCIAB.zip",
            checksum: "c35cbea58aee32c9bb7d021aacbb699f15bc964e1ad8ba33086945f0044f2fa9"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCConsent/5/1/8/TCConsent.zip",
            checksum: "392813eefd9af0b4e3e466fcc30f61fdd99b122cea504981c70c76c858fddac2"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/CommandersAct/iOSV5/raw/5.4.1/TCPartners/5/0/2/TCPartners.zip",
            checksum: "9b596c9eee9b8c10c245b0f145c8e7cd6cd8af8062669ad613e1fc1cff28b33f"
        ),  ]
)

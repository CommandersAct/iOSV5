// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
  name: "TagCommander SDK V5",
  platforms: [ .iOS(.v15), .tvOS(.v15)],
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
            url: "https://github.com/commandersact/iOSV5/releases/download/5.6.0/TCCore.zip",
            checksum: "32288d316608e836908d6ceb27845ccf0cc7e45d1eda511de9c29f595c9331cc"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.6.0/TCConsent.zip",
            checksum: "b5c9f7ad4e23e0360001b924e0dfa56af1466acd367d944465b2b90e7ee50412"
        ),
        .binaryTarget(
            name: "TCPartners",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.6.0/TCPartners.zip",
            checksum: "355d32c3a2839949ede1e489db1907e08f1fb42743e069291bf72c06d59128e0"
        ),
        .binaryTarget(
            name: "TCServerSide_noIDFA",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.6.0/TCServerSide_noIDFA.zip",
            checksum: "4b93992e803fa2fc22ba718ed443f1f8025763d945aa926d86f24a51a69897fe"
        ),
        .binaryTarget(
            name: "TCServerSide",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.6.0/TCServerSide.zip",
            checksum: "11ef39c97f0e02ad84d999c04819fdd2be3128b36cbb9e69af502a05de58d872"
        ),
        .binaryTarget(
            name: "TCIAB",
            url: "https://github.com/commandersact/iOSV5/releases/download/5.6.0/TCIAB.zip",
            checksum: "fca2bc3645be87b76b6313911e0e378873bd3044cb0f675ebd68e1527aa7ce22"
        ),  ]
)

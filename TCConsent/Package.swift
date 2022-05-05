// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCConsent",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TCConsent",
            targets: ["TCConsent"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "TCConsent-Bitcode-noIAB2",
            url: "https://github.com/TagCommander/iOSV5/raw/master/TCConsent/5/0/0/TCConsent-Bitcode-noIAB2.zip",
            checksum: "3c517eb9b6847b092b91f05c86641f2297a2154542728f1b347e67a1bb8792e5"
        ),
        .binaryTarget(
            name: "TCConsent",
            url: "https://github.com/TagCommander/iOSV5/raw/master/TCConsent/5/0/0/TCConsent.zip",
            checksum: "d945b614d2237a1e4438323a04429b4c20936e5c4d961237355a8fd10d199a54"
        )
    ]
    
)

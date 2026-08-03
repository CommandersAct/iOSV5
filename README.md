![alt tag](./res/ca_logo.png)

Developers' Implementation Guide
================================

[![SPM Compatible](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey)](https://github.com/CommandersAct/iOSV5)
[![Releases](https://img.shields.io/badge/release-check%20GitHub-blue)](https://github.com/CommandersAct/iOSV5-spm/releases)
[![iOS](https://img.shields.io/badge/iOS-13%2B-blue)](https://developer.apple.com/ios/)
[![CI](https://img.shields.io/badge/CI-passing-brightgreen?logo=gitlab)](https://gitlab.tagcommander.com)


Last update : *03/08/2026*

Release version : *5*

## Table of Contents

- [Developers' Implementation Guide](#developers-implementation-guide)
- [Introduction](#introduction)
- [Modules](#modules)
- [Latest available versions](#latest-available-versions)
- [Adding a module to your project](#adding-a-module-to-your-project)
  - [CocoaPods](#cocoapods)
  - [Build Variants](#build-variants)
  - [XCFramework](#xcframework)
  - [SPM](#spm)
  - [Demo Application](#demo-application)
- [Support and contacts](#support-and-contacts)

Introduction
============

TagCommander for mobile is a collection of small SDKs, each designed to serve a dedicated purpose. Adding only the modules you need keeps your binary lightweight — the Core module alone is under 50 KB, and each additional module adds roughly 110–120 KB.

**Minimum supported iOS version: 13.0**

Modules
=======

| Module | Purpose | Documentation |
|--------|---------|---------------|
| **Core** | Base module required by all other modules | [Core guide](TCCore/README.md) |
| **ServerSide** | Tag management via a server-side approach | [ServerSide guide](TCServerSide/README.md) |
| **Consent** | Collect and manage user privacy consent | [Consent guide](TCConsent/README.md) |
| **IAB** | IAB TCF v2 consent string support | [IAB guide](TCIAB/README.md) |

For each module, check the respective documentation for setup and usage details.


Latest available versions
=========================

Core : *5.4.6*

ServerSide : *5.5.0*

Consent : *5.4.1*

IAB : *5.2.0*

Partners : *5.0.4*

Adding a module to your project
===============================

You have three options for integrating a module into your iOS project: 

- CocoaPods 
- Swift Package Manager (SPM)
- Directly using the XCFramework files.


CocoaPods
---------

> [!NOTE]  
> We renamed all our pods. The pod names now reflect the exact content of the podspec (resolving the previous name warning).

	pod 'latest_TCCore', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/latest_TCCore.podspec'
	pod 'latest_TCServerSide', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/latest_TCServerSide.podspec'

You can also pin a specific version:

	pod 'TCCore', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/5/0/0/TCCore.podspec'
	pod 'TCServerSide', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/5/0/0/TCServerSide.podspec'

Build Variants
--------------

Each module now ships as a single variant, except:

- TCServerSide: one version without IDFA-related code (will not compile anything linked with `ASIdentifierManager`)

XCFramework
-----------

The latest versions are always available on GitHub: https://github.com/TagCommander/iosv5

> [!NOTE]  
> You must always include the Core module in your project.

After adding the frameworks, verify that Xcode has linked them correctly by checking:

- **General** tab → **Linked Frameworks and Libraries**
- **Build Phases** tab → **Link Binary With Libraries**
- That `FRAMEWORK_SEARCH_PATHS` includes the directories where the frameworks reside

SPM
---

Swift Package Manager is the easiest way to add Commanders Act's iOS libraries:

1. In Xcode, select **File → Swift Packages → Add Package Dependency**
2. Enter `https://github.com/CommandersAct/iOSV5/`
3. Choose the products you need

> [!TIP]
> If you switch from SPM to CocoaPods or a local XCFramework, clean your build folder first.
>
> If you change product variants or add new ones, re-add the iOSV5 package dependency and empty your build folder.

### Lightweight SPM repository

For faster Xcode checkouts, a dedicated binary-free repository is also available at [`CommandersAct/iOSV5-spm`](https://github.com/CommandersAct/iOSV5-spm) — it only contains the `Package.swift` file, with no binaries bundled.

The main repository ([`CommandersAct/iOSV5`](https://github.com/CommandersAct/iOSV5)) remains the primary source and will continue receiving all updates. The SPM repository is released alongside it as a lightweight alternative.

To use it, replace the package URL in step 2 with:
```
https://github.com/CommandersAct/iOSV5-spm
```

Demo Application
----------------

A full working example app integrating our libraries:

https://github.com/CommandersAct/tcmobiledemo-v5

Support and contacts
====================
![alt tag](./res/ca_logo.png)

***
**Support**
*support@commandersact.com*

http://www.commandersact.com

Commanders Act | 25 rue de Tolbiac, 75013 Paris - France
***

This documentation was generated on 03/08/2026 16:35:50
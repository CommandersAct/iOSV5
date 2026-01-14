![alt tag](../res/ca_logo.png)

Developers' Implementation Guide
================================

Last update : *14/01/2026*

Release version : *5*

## Table of Contents

- [Developers' Implementation Guide](#developers-implementation-guide)
- [Introduction](#introduction)
- [Latest available versions](#latest-available-versions)
- [Adding a module to your project](#adding-a-module-to-your-project)
- [Cocoapods](#cocoapods)
  - [Build Variants](#build-variants)
  - [XCFramework](#xcframework)
  - [SPM support](#spm-support)
  - [Demo Application](#demo-application)
- [Support and contacts](#support-and-contacts)

Introduction
============

TagCommander for mobile is a collection of small SDKs each designed to serve a dedicated purpose.
The modules are the following :

[Core : Used as a base by the other modules.](TCCore/README.md)

[ServerSide : Tag management system collecting data through a server-side approach.](TCServerSide/README.md)

[Consent : Pass the Consent settings to our tag system](TCConsent/README.md)


For each of those modules, please check their respective documentation for more information.


Latest available versions
=========================

Core : *5.4.4*

ServerSide : *5.4.6*

Consent : *5.3.8*

IAB : *5.2.0*

Partners : *5.0.4*

Adding a module to your project
===============================

If you want to add a module to your iOS project, you have several possibilities.

	- Using cocoapods to manage the dependency.
	- Using directly the framework files in your project.
    - Using SPM


Cocoapods
=========

> [!NOTE]  
>  We renamed all our pods! The names of the pod changed to be able to reflect the exact content of the podspec (and thus preventing the name warning).

All latests now point toward an XCode 12 compiled version. If you still need XCode 11, please check the changelogs and point to the pod inside the latest XCode 11 release available. XCode 11 is not supported anymore and no new releases will be made for it.

	pod 'latest_TCCore', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/latest_TCCore.podspec'
	pod 'latest_TCServerSide', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/latest_TCServerSide.podspec'

You can also point on a specific version (only for the latests builds):

	pod 'TCCore', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/5/0/0/TCCore.podspec'
	pod 'TCServerSide', :podspec => 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/5/0/0/TCServerSide.podspec'

Build Variants
--------------

> [!NOTE]  
>  Starting with XCode 14, Apple will no longer accept releases with Bitcode, so we removed the corresponding variants.

We had several variants depending on your needs, but when Bitcode was removed, we tried our best to limit as much as possible.

Right now all modules only have one version beside:

	- [for TCCore] : one regular version
    - [for TCServerSide] : one version without the code to get the IDFA
    - [for TCConsent] : one regular version
	- [for TCConsent] : one version made to work with IAB


The non-IDFA variant will not compile anything linked with ASIdentifierManager.


XCFramework
-----------

The latest version of our modules are always available on our github account: https://github.com/TagCommander/iosv5

> [!NOTE]  
>  You will always need to at least add the Core module to your project.

Add the modules you need to your project and confirm that XCode really added them for your Target at the following places:

	- In the "general" tab under "Linked Frameworks and Libraries"
	- In the "Build Phases" tab under "Link Binary With Libraries"
	- That the FRAMEWORK_SEARCH_PATHS do include the places where the frameworks are.

SPM support
-----------

Swift Package Manager is an easy and a simple way to install Commanders Act's iOS libraries:

    - In Xcode, select “File” → “Swift Packages” → “Add Package Dependency”

    - Enter https://github.com/CommandersAct/iOSV5/

    - Choose the right products for your project

> [!WARNING]
> If you need to switch your usage from SPM to cocoapods or local XCFramework, please make sur to clean your build folder.
>
> If you want to change products variants or add new ones, you'll need to re-add the iOSV5 package dependency and also empty your build folder.


Demo Application
----------------

You can find a full example of a working app integrating our libraries in the following repo :

https://github.com/CommandersAct/tcmobiledemo-v5

Support and contacts
====================
![alt tag](../res/ca_logo.png)

***
**Support**
*support@commandersact.com*

http://www.commandersact.com

Commanders Act | 7b rue taylor - 75010 PARIS - France
***

This documentation was generated on 14/01/2026 16:25:09

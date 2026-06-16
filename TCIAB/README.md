![alt tag](../res/ca_logo.png)

TCIAB Implementation Guide
===========================

Last update : *16/06/2026*

Release version : *5.2.0*

## Table of Contents

- [TCIAB Implementation Guide](#tciab-implementation-guide)
- [Introduction](#introduction)
- [Setup](#setup)
  - [IAB 2.1](#iab-21)
  - [IAB 2.2](#iab-22)
- [JSON Configuration Files](#json-configuration-files)
  - [vendor-list.json](#vendor-listjson)
  - [purposes-xx.json](#purposes-xxjson)
  - [privacy.json](#privacyjson)
  - [TCIABPublisherRestrictions.json](#tciabpublisherrestrictionsjson)
  - [google-atp-list.json](#google-atp-listjson)
- [Filtering vendors](#filtering-vendors)
- [Selecting buttons](#selecting-buttons)
  - [Initialisation](#initialisation)
- [With the ServerSide](#with-the-serverside)
- [Retaining consent](#retaining-consent)
- [Reacting to consent](#reacting-to-consent)
- [Generating publisher TC in consent string](#generating-publisher-tc-in-consent-string)
- [Loading a specific screen directly](#loading-a-specific-screen-directly)
- [Troubleshooting](#troubleshooting)
- [Support and contacts](#support-and-contacts)

Introduction
============

The TCIAB module adds IAB TCF v2 support to the Consent module. When TCIAB is linked alongside TCConsent, things that change:

- The Privacy Center (`TCPrivacyCenterViewController`) adds an IAB-compliant first layer on launch, before the category/vendor screen.

- The Privacy Center's category and vendor screens include IAB categories and vendors alongside any custom categories and vendors you have defined.

- When consent is saved, TCF Consent String and other required value are also created and saved in-app.

Everything else — how consent is saved, forwarded to ServerSide, and accessed via callbacks — works identically to a non-IAB setup.

> [!NOTE]
> This module only supports TCF v2. TCF v1 is not supported.

Setup
=====

Add the TCIAB module alongside the TCConsent module. No additional initialisation code is required — once both modules are present, the Privacy Center automatically shows the IAB first layer on launch and generates the IAB consent string.

You will need several JSON configuration files. These are updated automatically by the library, but offline copies in your project prevent issues on poor or missing connections.

IAB 2.1
-------

We support IAB 2.1. Add the following translation keys to your `privacy.json` to display the new information correctly:

```json
"texts": {
    "generic": {
        "month": "months",
        "day": "days",
        "seconds": "seconds",
        "hours": "hours"
    },
    "vendors": {
        "deviceStorageTitle": "Storage Type:",
        "deviceStorageCookieLifetime": "Cookie lifetime: ",
        "deviceStorageOther": "Others",
        "deviceStorageCookies": "Cookies"
    }
}
```

IAB 2.2
-------

To upgrade to IAB 2.2, first upgrade TCConsent to version `5.4.0` or higher, then:

1. Replace all offline in-app JSON files with IAB 2.2 compatible versions. This includes `vendor-list.json` and any `purposes-xx.json` translation files.
2. Update your `privacy.json` (both the offline copy and your CDN version) to be IAB 2.2 compatible. Review the `vendors` key at the root to re-check your IAB vendor filter.
3. Ensure your `"popup" → "purposeTitle"` value contains the `{total_number}` placeholder.

Add the following keys to your `privacy.json`:

```json
"texts_xx": {
    "generic": {
        "illustationsButton": "illustrations:",
        "dataCategoriesDef": "Data Categories:"
    },
    "vendors": {
        "legIntClaimTitle": "Politique de legitimate"
    },
    "popup": {
        "purposeTitle": "We and our {total_number} partners"
    }
}
```

JSON Configuration Files
=========================

vendor-list.json
----------------

This file contains all IAB-registered vendors, along with definitions (in English) for all purposes, special purposes, features, and special features.

Download an offline copy from https://vendorlist.consensu.org/v3/vendor-list.json and include it in your project under the same filename.

purposes-xx.json
----------------

If your application supports multiple languages, you will need translation files for each language. These files are maintained by IAB.

Download translation files from https://register.consensu.org/translations/translationsEu under "List of translations for purpose descriptions TCF EU:", keeping the original filenames.

Call the following line right after initialising `TCMobileConsent` to set the language:

in swift:

```swift
TCMobileConsent.sharedInstance().setLanguage("fr")
// Use ISO 639-1 language codes
```

in objective-c:

```objc
[[TCMobileConsent sharedInstance] setLanguage: @"fr"];
// Use ISO 639-1 language codes
```

privacy.json
------------

This file declares the information used to record consent in our dashboards, as well as any texts in the interface that are not defined by IAB.

> [!WARNING]
> This file should be provided by your Commanders Act consultant.

If you are using multiple languages, you will find `"texts"` (the default) and one `"texts_xx"` block per additional language.

TCIABPublisherRestrictions.json
--------------------------------

> [!NOTE]
> This file is optional.

This file represents the restrictions your company (as publisher) applies to its partners. If you have one, include it alongside the other configuration files and call the following line right after initialising the Consent module:

in swift:

```swift
TCMobileConsent.sharedInstance().useCustomPublisherRestrictions()
```

in objective-c:

```objc
[[TCMobileConsent sharedInstance] useCustomPublisherRestrictions];
```

> [!WARNING]
> This should be decided by your project manager. The file should be created by your Commanders Act contact.

google-atp-list.json
--------------------

> [!NOTE]
> This file is optional and only needed if you are using Google AC String.

Include this file alongside the other configuration files. Call the following line **before** initialising the Consent module:

in swift:

```swift
TCMobileConsent.sharedInstance().useAcString(true)
```

in objective-c:

```objc
[[TCMobileConsent sharedInstance] useAcString: YES];
```

If you are using AC String, also make sure your `privacy.json` contains a list of Google vendors. This file can only be provided by your consultant and will be updated automatically by the library.

Filtering vendors
=================

By default, the full IAB vendor list is displayed. To show only the vendors your company uses, add a `vendors` field inside the `"information"` section of `privacy.json`:

```json
"information": {
    "vendors": "8,18,467,310"
}
```

This filters the displayed vendors to those with the given IDs, and also filters the purposes and special features the user is asked to consent to.

> [!WARNING]
> This should be decided by your project manager and added to the JSON by your Commanders Act contact.

Selecting buttons
=================

The IAB interface has two layers. The first layer is the initial popup screen. The second layer includes the purpose screen and the vendor screen.

Default buttons:

- First layer: **Detail** (opens the purpose screen), **Accept All**, **Refuse All**
- Second layer: **Save** (saves the current switch state), **Accept All**, **Refuse All**

IAB requires at least a **Detail** button on the first layer and a **Save** button on the second. Since September 2020, the CNIL requires that if you have an **Accept All** button, a **Refuse All** button with equal visual prominence must also be present.

To configure which buttons appear and in what order, add the following to your `privacy.json`:

```json
"components": {
    "firstLayerButton": ["Detail", "AcceptAll", "RefuseAll"],
    "secondLayerButton": ["Save", "AcceptAll", "RefuseAll"]
}
```

Remove entries you do not want. For example, to remove the Refuse All button, remove `"RefuseAll"` from the array.

Initialisation
--------------

In swift:

```swift
// Register callbacks first if needed.
TCMobileConsent.sharedInstance().registerCallback(self)

TCMobileConsent.sharedInstance().setSiteID(3311, andPrivacyID: 320)

// Set language if needed.
TCMobileConsent.sharedInstance().setLanguage("fr")
```

In objective-c:

```objc
// Register callbacks first if needed.
[[TCMobileConsent sharedInstance] registerCallback: self];

[[TCMobileConsent sharedInstance] setSiteID: 3311 andPrivacyID: 320];

// Set language if needed.
[[TCMobileConsent sharedInstance] setLanguage: @"fr"];
```

With the ServerSide
===================

Using IAB with ServerSide requires no special handling. All saved IAB consent information is automatically forwarded in every ServerSide hit, so you can use any IAB purpose as a consent category and build rules around it in your container.

Retaining consent
=================

[See the Consent module documentation.](../TCConsent/README.md#retaining-consent)

Reacting to consent
===================

[See the Consent module documentation.](../TCConsent/README.md#reacting-to-consent)

Generating publisher TC in consent string
==========================================

The publisher TC part of the consent string is not generated by default. To enable it, set the following boolean on `TCMobilePrivacy`:

```swift
TCMobilePrivacy.sharedInstance().generatePublisherTC = true
```

Loading a specific screen directly
====================================

By default, launching the Privacy Center with TCIAB shows the IAB first layer screen. If you have built your own first layer and want to open the Privacy Center directly to the second layer (purpose or vendor screen), bypassing the IAB first layer, use the following:

**Purpose screen:**

in swift:

```swift
let PCM = TCPrivacyCenterViewController()
PCM.startWithPurposeScreen()
self.navigationController?.pushViewController(PCM, animated: false)
```

in objective-c:

```objc
TCPrivacyCenterViewController *PCM = [[TCPrivacyCenterViewController alloc] init];
[PCM startWithPurposeScreen];
[self.navigationController pushViewController: PCM animated: NO];
```

**Vendor screen:**

in swift:

```swift
PCM.startWithVendorScreen()
```

in objective-c:

```objc
[PCM startWithVendorScreen];
```

Troubleshooting
===============

Enable verbose logging before initialising the module:

in swift:

```swift
#if DEBUG
    TCDebug.setLogLevel(.verbose)
#endif
```

After the user saves consent in the Privacy Center, check the Xcode console for a log entry containing the generated IAB consent string. It will look something like:

```
[TCIAB] TC String generated: COwGmGhOwGmGh...
```

If this line does not appear:

- Confirm that `vendor-list.json` and `privacy.json` are present in your project bundle.
- Confirm that both TCIAB and TCConsent are linked in your target.
- Confirm that you are using a TCConsent version that supports IAB 2.2 if you have upgraded your JSON files to 2.2.

Support and contacts
====================

![alt tag](../res/ca_logo.png)

***
**Support**
*support@commandersact.com*

http://www.commandersact.com

Commanders Act | 25 rue de Tolbiac, 75013 Paris - France
***

This documentation was generated on 16/06/2026 16:16:10
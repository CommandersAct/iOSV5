![alt tag](../res/ca_logo.png)

TCIAB's Implementation Guide
==============================

Last update : *19/02/2026*

Release version : *5.2.0*

## Table of Contents

- [TCIAB's Implementation Guide](#tciabs-implementation-guide)
- [Introduction](#introduction)
- [Setup](#setup)
  - [IAB 2.1](#iab-21)
  - [IAB 2.2](#iab-22)
- [JSON Configurations](#json-configurations)
  - [vendor-list.json](#vendor-listjson)
  - [purposes-xx.json](#purposes-xxjson)
  - [privacy.json](#privacyjson)
  - [TCIABPublisherRestrictions.json](#tciabpublisherrestrictionsjson)
  - [google-atp-list.json](#google-atp-listjson)
- [Filtering vendors](#filtering-vendors)
- [Selecting buttons](#selecting-buttons)
- [With the ServerSide](#with-the-serverside)
- [Retaining consent](#retaining-consent)
- [Reacting to consent](#reacting-to-consent)
- [Generating publisher TC in consent String](#generating-publisher-tc-in-consent-string)
- [Loading a specific screen directly](#loading-a-specific-screen-directly)
- [Support and contacts](#support-and-contacts)

Introduction
============

This module has been made especially to support the creation of the IAB consent string.

/!\ It only supports the version 2 of the consent string. Namely, TCF v2.

Setup
=====

You need to have this module alongside the Consent Module in your project.

You will need several configuration files to use this module.
All of those configurations will update automatically but having an offline version will prevent any hazardous behaviour over bad internet connection.

IAB 2.1
-------

We support IAB 2.1, but you will need to add some translation in your privacy.json file. Hereafter are the lines you need to add in order to display the new information properly.


```javascript
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
      },

```

IAB 2.2
-------

We support IAB 2.2, the following steps are required once you decide to upgrade your TCConsent to a IABv2.2 compatible version, wich is TCConsent:5.3.8+  or higher.

	- Please update all of your offline in-app jsons to a V2.2 compatible version, this includes your offline vendor-list.json & any purposes-xx.json translation file you're using.
	- Update your privacy.json offline & cdn file with a refreshed IABv2.2 compatible version and recheck your iab vendors filter, `vendors` key on root.
	- Also make sure to have a `{total_number}` inside your `text-> popup -> purposeTitle ` value.

Here are the lines you need to add in order to display the new information properly :

```
  texts_xx": {
    "generic" : {
        "illustationsButton": "illustrations:",
        "dataCategoriesDef": "Data Categories:",
    }, 
    "vendors" : {
        "legIntClaimTitle": "Politique de legitimate"
    },
    "popup" : {
        "purposeTitle": "We and our {total_number} partners"
    }
  },
```

JSON Configurations
===================

vendor-list.json
----------------

This file contains all vendors that have a partnership with IAB. It also contains the definition (in English only) for all purposes, special purposes, features, special features and what the vendors are using.
This file is created and supported by IAB.

Please download and put an offline copy in your project of https://vendorlist.consensu.org/v2/vendor-list.json
Keeping the same name.


purposes-xx.json
----------------

If you are using more than one language in your application you will need to also have a copy of those files. Those files are created and supported by IAB.
For example, our IAB demo is using purposes-fr.json.

If you need translation files, download them from https://register.consensu.org/translation under "List of translations for purpose descriptions v2.0". Also keeping the same file name.

Call this line right after the initialisation of the TCPrivacy module:

in objective-c : 

```objc
	[[TCMobileConsent sharedInstance] setLanguage: @"fr"];
	// Please use ISO 639-1 language codes
```

in swift : 

```swift
	TCMobileConsent.sharedInstance().setLanguage("fr")
	// Please use ISO 639-1 language codes
```

privacy.json
------------

This file declares information used to save the consent in our dashboards as well as texts present in the interface that are not declared officially by IAB.

/!\ This file should be provided by one of our consultant.

If you are using several languages, you should find, in addition to "texts" which have the default values, "texts_xx" for each language.


TCIABPublisherRestrictions.json
-------------------------------

/!\ This file is a bit more specific and not mandatory.

It is here to represent the restrictions a publisher (your company) is applying its partners.

If you have a file, you need to put it with the other json configurations and add a small line later in the code.
Call this line right after the initialisation of the TCConsent module:

in objective-c : 

```objc
    [[TCMobileConsent sharedInstance] useCustomPublisherRestrictions];
```

in swift : 

```swift
    TCMobileConsent.sharedInstance().useCustomPublisherRestrictions()
```

> [!WARNING]  
> This should normally be decided by your project manager and the file should be created by your Commanders Act contact.

google-atp-list.json
--------------------

> [!NOTE]  
> This file is a bit more specific and not mandatory.

Only use this file if you are using Google AC-String.

If you have a file, you need to put it with the other json configurations.
To init it, you will have to call the following line BEFORE the initialization of the Consent module:

in objective-c : 

```objc
	[[TCMobileConsent sharedInstance] useAcString: YES];
```

in swift : 

```swift
	TCMobileConsent.sharedInstance().useAcString(true)
```

If you are using AC-String please verify that you have a list of google vendors inside your privacy.json as well.

This file can only be provided by your consultant and will be updated by the library automatically.

Filtering vendors
=================

It is possible that instead of displaying all the hundreds of vendors in the vendor list, you'd rather display only the one your company needs. This will also filter all purposes and special features that we ask the user to consent to.

If you want to filter, nothing has to be done inside the code, but you should find inside the privacy.json in "information" a field like : "vendors": "8,18,467,310".

This tells that you are only using the vendors which IDs are 8, 18, 467 and 310. Those IDs refer to the IDs they are given inside the vendor-list.

> [!WARNING]  
> This should normally be decided by your project manager and added inside the json by your Commanders Act contact.

Selecting buttons
=================

The IAB interface is separated in 2 layers. The first layer is the first screen you'll see when opening the privacy center.
The second layer is the purpose screen as well as the vendor screen.

In those 2 interfaces, the default buttons are defined as followed:

First layer: "Detail" (lead to the purpose detail screen), "Accept All" and "Refuse All"
Second layer: "Save" (use the current state of all switches), "Accept All" and "Refuse All"

IAB asks that you have at least a "Detail" button on the first layer, and a "Save" on the second.
Starting September 2020 the CNIL asks that if you have an "Accept all" button, you need a "Refuse all" button with an identical visual.

Meanwhile, you can select the button you want to see as well as the order they'll appear in among the default ones by changing part of the privacy JSON.

```
	"components": {
	    "firstLayerButton": ["Detail", "AcceptAll", "RefuseAll"],
	    "secondLayerButton": ["Save", "AcceptAll", "RefuseAll"],
	},
```

You can add those lines and select the needing ones. For example, if you don't want a refuse all button, just remove "RefuseAll".

Initialisation

in objective-c : 

```objc 
	// If you need to use callbacks.
	[[TCMobileConsent sharedInstance] registerCallback: self];

	[[TCMobileConsent sharedInstance] setSiteID: 3311 andPrivacyID: 320];

	// Use this if you need to use a specific language
	[[TCMobileConsent sharedInstance] setLanguage: @"fr"];
```

in swift :

```swift
	// If you need to use callbacks.
	TCMobileConsent.sharedInstance().registerCallback(self)

	TCMobileConsent.sharedInstance().setSiteID(3311, andPrivacyID: 320)

	// Use this if you need to use a specific language
	TCMobileConsent.sharedInstance().setLanguage("fr")
```

With the ServerSide
===================

You can use classic Tag Management with IAB if needed. Doing this is really simple as all saved information used for IAB configuration will be forwarded to each server-side call.
This mean that you can use any IAB purpose as a category and create rules in your container accordingly.

Retaining consent
=================

[Please see the specific documentation here](../TCConsent#retaining-consent)

Reacting to consent
===================

[Please see the specific documentation here](../TCConsent#reacting-to-consent)

Generating publisher TC in consent String
=========================================

By default, as some clients asked, the publisher TC part of the consent string is not generated.
But you have a boolean in TCConsent/TCMobilePrivacy which is named generatePublisherTC that you can change to true.

Loading a specific screen directly
==================================

By default, the screen loaded is what we call the first layer screen (or pop-up screen). Then from this screen you'll be able to go to the purpose screen and from the purpose screen to the vendor screen. Both of which are called the second layer.

if you want to have your own first layer, you'll want to be able to open from this page either of our second layer pages.

To do this, we created other ways to open the privacy center as follow:


in objective-c : 

```objc
    TCPrivacyCenterViewController *PCM = [[TCPrivacyCenterViewController alloc] init];
    [PCM startWithPurposeScreen];
    [self.navigationController pushViewController: PCM animated: NO];
```

in swift : 

```swift
    let PCM = TCPrivacyCenterViewController()
    PCM.startWithPurposeScreen()
    self.navigationController.pushViewController(PCM, animated: false)
```

or for the vendor screen:

in objective-c : 

```objc
    [PCM startWithVendorScreen];
```

in swift : 

```swift
    PCM.startWithVendorScreen()
```

Support and contacts
====================

![alt tag](../res/ca_logo.png)

**Support**
*support@commandersact.com*

http://www.commandersact.com

Commanders Act | 7b rue taylor - 75010 PARIS - France
***

This documentation was generated on 19/02/2026 14:12:03

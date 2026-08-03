![alt tag](../res/ca_logo.png)

Partners' Implementation Guide
==============================

Last update : *03/08/2026*

Release version : *5.0.4*

## Table of Contents

- [Partners' Implementation Guide](#partners-implementation-guide)
- [Introduction](#introduction)
- [Partners](#partners)
  - [Adobe Audience Manager (AAM)](#adobe-audience-manager-aam)
  - [Hit](#hit)
  - [Freewheel](#freewheel)

Introduction
============

In some specific cases we need to have a direct connection from the phone to a vendor.

In this case hits need to be sent from the phone and we need to treat the response from the server inside the app.


Partners
========

TCPartners or TCMobilePartners is the class used as the super-type of all partners.

A TCPartner is by default a partner that will listen to all hits you're passing to the SDK so he can work on them.
You can change this activation by using on of the 3 following functions:

```objc
	/**
	 * This function tells the partner to activate on all hits.
	 */
	- (void) activateOnAllHits;

	/**
	 * This function tells the partner to only treat hit when the specified key is in the datalayer.
	 * @param key the key to activate the treatment.
	 */
	- (void) activateOnKey: (NSString *) key

	/**
	 * This function tells the partner to only treat hit when the specified key/value pair is in the datalayer.
	 * @param key the specific key.
	 * @param value the specific value.
	 */
	 - (void) activateOnKey: (NSString *) key andValue: (NSString *) value

	/**
	 * This function tells the partner to only treat hit when the specified key is NOT in the datalayer.
	 * @param key the key to prevent the activation.
	 */
	 - (void) activateOnAllHitsButKey: (NSString *) key

	/**
	 * This function tells the partner to only treat hit when the specified key/value pair is NOT in the datalayer.
	 * @param key the specific key.
	 * @param value the specific value.
	 */
	 - (void) activateOnAllHitsButKey: (NSString *) key andValue: (NSString *) value
```

So think carefully about which activation method you want for your partners.

Adobe Audience Manager (AAM)
----------------------------

The point of this connector is the send information to Adobe Audience Manager and get back the segments corresponding to the app user.

```objc	
	[[TCPartners_AdobeAudienceManager sharedInstance] setDataSourceID: 81811 andPlatformID: 20201];
	[[TCPartners_AdobeAudienceManager sharedInstance] initSegmentation];
```

If you want to use your custom configuration to use offline segments ID, please also add this line.

```objc
    [[TCPartners_AdobeAudienceManager sharedInstance] addOfflineConfigurationForSiteID: 3311 andContainerID: 1];
```

This connector only works if we have and IDFA or AAID.

Hit
---

Since we're potentially sending information to several partners we need to differentiate the data for AAM.
We're basing ourselves on the datalayer and are taking all the keys prefixed "c_" as keys to add to the hits sent to AAM.

If among the data layer, the connector finds the key #USER_ID#, we will send an "identified" hit. Which simply behave slightly differently, but has the same use.


Freewheel
---------

Our Freewheel implementation is only made to forward the segments computed in Adobe for them.

This means we only need 2 things to make it work.

The first one is the callback function that should be called when we parsed the segment information.

The second is the domain which correspond to the application. This is needed because AAM can send information from several different app domains when you have several configured.

You will have to register to a callback to receive the content of the segments.

And will receive a response of the format:

```
	{
		aam_fr=sid=81025,
		aam_oas=PYT_63359=Y,
		aam_fw=PYT_63359=Y&PYT_619=Y&PYT_7398=Y&PYT_94221
	}
```

To initialize Freewheel:

```objc
	[[TCPartners_Freewheel sharedInstance] setDomain: @".tf1.fr"];
	[[TCPartners_Freewheel sharedInstance] setCallback: self];
```

And to recover the segments:


```objc
	- (void) onSegmentReceived: (NSDictionary *) segments
	{
		[[TCLogger sharedInstance] logMessage: [NSString stringWithFormat: @"onSegmentReceived: %@", segments] withLevel: TCLogLevel_Error];
	}
```

# Support and contacts

![alt tag](../res/ca_logo.png)

***
**Support**
*support@commandersact.com*

http://www.commandersact.com

Commanders Act | 25 rue de Tolbiac, 75013 Paris - France
***

This documentation was generated on 03/08/2026 16:35:50

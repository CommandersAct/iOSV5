![alt tag](../res/ca_logo.png)

ServerSide's Implementation Guide
=================================

Last update : *19/02/2026*
Release version : *5.4.7*

## Table of Contents

- [ServerSide's Implementation Guide](#serversides-implementation-guide)
- [Introduction](#introduction)
  - [Main Technical Specifications](#main-technical-specifications)
  - [Event](#event)
  - [Commanders Act's TCEvent payloads Data](#commanders-acts-tcevent-payloads-data)
  - [Executing an event](#executing-an-event)
- [ServerSide's module integration](#serversides-module-integration)
  - [Steps](#steps)
  - [Integration of the ServerSide's Module](#integration-of-the-serversides-module)
  - [Dependencies](#dependencies)
  - [Compiler Flags](#compiler-flags)
  - [Compatibility](#compatibility)
- [Using the ServerSide's module](#using-the-serversides-module)
  - [Initialisation](#initialisation)
  - [Executing events](#executing-events)
  - [Customising Events](#customising-events)
  - [Generic properties :](#generic-properties)
  - [Custom events](#custom-events)
  - [Video Events](#video-events)
  - [Consent](#consent)
  - [Background Mode](#background-mode)
  - [Deactivating the ServerSide's module](#deactivating-the-serversides-module)
  - [Wait for User-agent](#wait-for-user-agent)
  - [Getting IDFA](#getting-idfa)
- [Firebase Destination](#firebase-destination)
  - [Supported Firebase Event](#supported-firebase-event)
- [Troubleshooting](#troubleshooting)
- [Debugging](#debugging)
  - [Testing](#testing)
  - [Common errors](#common-errors)
  - [Using a custom process pool](#using-a-custom-process-pool)
- [Helpers](#helpers)
  - [Persisting variables](#persisting-variables)
- [Swift](#swift)
- [Example: TCDemo](#example-tcdemo)
- [Migration v4 to v5](#migration-v4-to-v5)
  - [Why a new version of the SDK](#why-a-new-version-of-the-sdk)
  - [Event based](#event-based)
  - [Changes](#changes)
  - [Example](#example)
  - [Useful methods](#useful-methods)
- [Support and contacts](#support-and-contacts)

Introduction
============

Commanders Act enables marketers to easily add, edit, update, and deactivate tags on web pages, videos and mobile applications with little-to-no support from IT departments.

Instead of implementing several SDK's in the application, Commanders Act for mobile provides clients with a single module which sends data to our servers which then create and send information to your partners.

Thanks to remote configuration tools, it is also possible to modify the configuration without having to resubmit your application.

The purpose of this document is to explain how to add the ServerSide module into your application.


Main Technical Specifications
-----------------------------

- Weight from 110 ko to 120 ko in your application depending on the iPhone model.
- Fully threaded and asynchronous.
- Offline mode (the hits are stored in the phone to be replayed when is convenient)
- Very low CPU and memory usage.
- Information collected and sent automatically while respecting GDPR.
- Background mode, in the case you need to send data while the application is in background.

Event
-----

An event represent something happening inside your application. For example, we have "add to cart" or "login" events.
Inside the library they are represented each by a specific class which in turn provide you with information needed for this event to be used by your solutions.

For example, we know that for a "view cart" event, you will have to provide a list of the items inside the cart for the event to be valid.
We also add "value" and "currency" that are generally used by solutions for this event that can be filled inside the class.

Your company alongside our consulting team will usually define step by step what events the want the application to send and what parameters are needed for the solutions which will in turn treat those events.

You should be provided with a document explaining all events you need to implement inside your application and when they should be sent.

The event and the information we gather independently will create a hit to our servers with a JSON payload.

Commanders Act's TCEvent payloads Data
--------------------------------------

Our TCEvents payloads consist of various sections organized within a JSON payload sent to our CommandersAct servers once you call the `execute` function.
Each section has its specific behaviour. Refer to the provided scheme for insights into each section, guidance on manipulation, changing values, and understanding intended behavior.


![alt tag](../res/TCEvent.png)


![alt tag](../res/warning.png)
All events and their payloads are detailed here with code examples: [events-reference](https://doc.commandersact.com/developers/tracking/events-reference)

You will also find information about what you can add inside the TCUser which is sent with every hit.
Be aware that some data inside TCUser require consent from the user te be read and used.

![alt tag](../res/warning.png)
You can also check this page to see the link between the event names and the SDK's Class names and all information inside the payload here:
[mobile-sdk-event-specificity](https://community.commandersact.com/platform-x/developers/tracking/about-events/mobile-sdk-event-specificity)


Executing an event
------------------

When you call the sendData method, a hit will be packaged and sent to Commanders Act's server.

![alt tag](../res/server_side_module_scheme.png)


ServerSide's module integration
===============================

Steps
-----

You can divide the integration of CommandersAct ServerSide's module into the next few steps:

 1. Adding the Core and ServerSide libraries to your Project.
 2. Implementing the ServerSide module and adding events to your application.
 3. Verify that all tags are being sent.

Integration of the ServerSide's Module
--------------------------------------

[Please check the Developers Implementation Guide to chose the best way to implement this module in your project.](../README.md)

Dependencies
------------

The ServerSide's module requires the following frameworks:

- SystemConfiguration.framework
- libz.dylib

Compiler Flags
-------------
Please add the following option to your projects setting or xcconfig file

OTHER_LDFLAGS = $(inherited) -ObjC

Compatibility
-------------

- Architecture: armv7, arm64, i386 and x86_64, bitcode sections
- iOS version: 9.0 minimum
- Compiled with the ENABLE_BITCODE = YES option
- Compiled with ARC enabled

Using the ServerSide's module
=============

Initialisation
--------------

It is recommended to initialise TCServerSide in your `AppDelegate's applicationdidFinishLaunchingWithOptions` so it will be operational as soon as possible.

You will need 2 things provided by our consulting team. A siteID which is representing the web platform in which you setup your destinations.
And a sourceKeyID which will represent the Android source inside your setup.

If you are using our Consent module, you can also change during this initialisation the default ServerSide behaviour while waiting for the user consent.
More information a bit later in this document.

A single line of code is required to properly initialize an instance of ServerSide, and you can add one more for better logging:

in objective-c :

```objc
    //!\\ Important while integrating TCServerSide
    [TCDebug setDebugLevel: TCLogLevel_Verbose];
    ServerSide *serverSide = [[ServerSide alloc] initWithSiteID: siteID andSourceKey: sourceKey];
```

in swift : 

```swift
    //!\\ Important while integrating TCServerSide
	TCDebug.setNotificationLog(true)
	let serverSide = ServerSide.init(siteID: siteID, andSourceKey: sourceKey)
```

Executing events
----------------

Each time you are required to launch an event, simply instantiate the corresponding event, fill it with what your tagging plan suggest and execute it.

in objective-c : 

```objc
	NSMutableArray *items = [[NSMutableArray alloc] init];
	[items addObject: [[TCItem alloc] initWithItemId: @"iID1"
									  withProduct: [[TCProduct alloc] initWithProductId: @"pID1" withName: @"pName1" withPrice: @1.5f]
									  withQuantity: 1]];

	[items addObject: [[TCItem alloc] initWithItemId: @"iID2"
									  withProduct: [[TCProduct alloc] initWithProductId: @"pID2" withName: @"pName2" withPrice: [[NSDecimalNumber alloc] initWithFloat: 2.5f]]
								  	withQuantity: 2]];

	TCPurchaseEvent *event = [[TCPurchaseEvent alloc] initWithId: @"ID"
													  withRevenue: [[NSDecimalNumber alloc] initWithString: @"1.1"]
													  withValue: [[NSDecimalNumber alloc] initWithString: @"12.2"]
													  withCurrency: @"EUR"
													  withType: @"purchase"
													  withPaymentMethod: @"CreditCard"
													  withStatus: @"waiting"
													  withItems: items];

	[serverSide execute: event];
```

in swift : 

```swift
	  let tc_item = TCItem.init(itemId: "iID1", with: TCProduct(productId: "pID1", withName: "pName1", withPrice: 1.5), withQuantity: 1)
	  let tc_item_2 = TCItem.init(itemId: "iID2", with: TCProduct(productId: "pID2", withName: "pName2", withPrice: 2.5), withQuantity: 2)
	  let items = [tc_item, tc_item_2];
        
	  let event = TCPurchaseEvent(id: "ID", withRevenue: 1.1, withValue: 12.2, withCurrency: "EUR", withType: "purchase", withPaymentMethod: "CreditCard", withStatus: "waiting", withItems: items)
	  serverSide?.execute(event)
```

Customising Events
---------------------

Events are tailored for the most common solutions' needs. But you might need to add properties that are not specified in the event you are trying to send.

You can choose to edit your events by directly accessing the event object property, or you can choose to add new properties. Depending on your needs, you can use the following methods to achieve this.

```
    /!\ - It is possible to access directly additionalProperties for wrapper purposes, but it's highly recommended to avoid doing so as it may break your event paylaod format. Only do it if you know exactly what you're doing.

    - (void) addAdditionalProperty: (NSString *) key withStringValue: (NSString *) value;
    - (void) addAdditionalProperty: (NSString *) key withDictValue: (NSDictionary *) json;
    - (void) addAdditionalProperty: (NSString *) key withBoolValue: (BOOL) value;
    - (void) addAdditionalProperty: (NSString *) key withNumberValue: (NSDecimalNumber *) value;
    - (void) addAdditionalProperty: (NSString *) key withDigitStringValue: (NSString *) value; // value here is a DigitString that'll be parsed to a precised number
    - (void) addAdditionalProperty: (TCDynamicStore *) store;
```

Also, for accessing & removing already added properties :

```
    - (NSMutableDictionary *) getAdditionalProperties;
    - (void) removeAdditionalProperty: (NSString *) key;
    - (void) clearAdditionalProperties;
```

Here for example this could be tracking some user going back to your configuration to open the consent interface. And you would want to know what was the consent before re-opening.
Of course this is a simple example only here to show the addAdditionalProperty method.

in objective-c : 

```objc 
    TCPageViewEvent *pageViewEvent = [[TCPageViewEvent alloc] initWithType: @"Consent"];
    pageViewEvent.pageName = @"Configuration";
    [pageViewEvent addAdditionalProperty: @"currentConsent" withStringValue: @"refused"];
```
in swift : 

```swift
    let pageViewEvent = TCPageViewEvent(type: "Consent")
    pageViewEvent.pageName = @"Configuration";
    pageViewEvent?.addAdditionalProperty("currentConsent", withBoolValue: "refused")
```

If you want to customize the other fields in your events, you can directly edit properties on the coresponding singleton instance (except for TCLifecycle) or use custimisation methodes.

Please note that these are constant fields across the events, changes will be applied to all events at once.
Here's a list of the available editable fields :

- [TCDevice sharedInstance]
- [TCNetwork sharedInstance]
- [TCUser sharedInstance]
- [TCApp sharedInstance]
- [TCLifecycle sharedInstance]
- TCItem and TCProduct objects

For TCDevice's inner fields, Os & Screen are accessible via :
in objective-c : 

```objc
    [[TCDevice sharedInstance] getOsProperties]
    [[TCDevice sharedInstance] getScreenProperties]
```

in swift : 
        
```swift
    TCDevice.sharedInstance().getOsProperties()
    TCDevice.sharedInstance().getScreenProperties()
```

Generic properties :
-------------------
Some properties require access to additional protected resources, bluetooth for example.
We have default values to always have a valid datalayer for those. But if you need the real value for your partners, you will need to ask for permissions if needed and fill the value by yourself. They are set as public so it should be easy for you.

| Class.propertyName  | Value type  | default value |
|---------------------|-------------|---------------|
| TCNetwork.bluetooth | Boolean     | false         |

Custom events
-------------

In some case, the classic events might not suit your needs, in this case you can build complete custom events.
It is important to name them properly as this will be the base of forwarding them to your destinations.

in objective-c :

```objc 
    TCCustomEvent *event = [[TCCustomEvent alloc] initWithName: @"eventName"];
    [event addAdditionalParameter: @"myParam" withValue: @"myValue"];
    [TCS execute: event];
```

in swift :

```swift
    let event = TCCustomEvent(name: "eventName")
    event?.addAdditionalProperty("myParam", "myValue") 
    tc?.execute(event)
```

Video Events
------------

There are 4 main video events classes : TCVideoSettingEvent, TCVideoPlaybackEvent, TCVideoContentEvent & TCVideoAdEvent. 

Every Video event will have multiple modes, choose the  right mode for each event you're sending. 

You'll have to manage your video_session_id across the video events you're sending. 

if you have multiple videos, you'll need to set multiple video_session_id for every one of them. 


example : 

in objective-c : 

```objc 
    TCVideoAdEvent *event = [[TCVideoAdEvent alloc] initWithMode: video_ad_start andSessionId: @"0000-0000-0001"];// first video
    TCVideoAdEvent *event_2 = [[TCVideoAdEvent alloc] initWithMode: video_ad_playing andSessionId: @"0000-0000-0001"];// another event for the first video!
    
    [serverSide execute: event];
    [serverSide execute: event_2];
    
    TCVideoAdEvent *event_3 = [[TCVideoAdEvent alloc] initWithMode: video_ad_start andSessionId: @"0000-0000-0002"];// second video
    TCVideoAdEvent *event_4 = [[TCVideoAdEvent alloc] initWithMode: video_ad_playing andSessionId: @"0000-0000-0002"];// another event for the second video!

    [serverSide execute: event_3];
    [serverSide execute: event_4];
```

in swift : 

```swift
    let event = TCVideoAdEvent(wIthMode: video_ad_start, andSessionId: "0000-0000-0001") // first video
    let event_2 = TCVideoAdEvent(wIthMode: video_ad_playing, andSessionId: "0000-0000-0001") // another event for the first video!

    serverSide?.execute(event)
    serverSide?.execute(event_2)

    let event_3 = TCVideoAdEvent(wIthMode: video_ad_start, andSessionId: "0000-0000-0002") // second video
    let event_4 = TCVideoAdEvent(wIthMode: video_ad_playing, andSessionId: "0000-0000-0002") // another event for the second video !
    serverSide?.execute(event_3)
    serverSide?.execute(event_4)
```

Consent
-------

To manage the privacy of the user's data you can use our Consent product, another product or nothing at all.

By default, the ServerSide module will try to see if you have added our Privacy module. If so, it will put itself into a waiting for consent mode.
In this mode, it will record all hits but wait to consent information to either send everything or delete all waiting hits.

If you don't use our Consent module, the ServerSide's will be enabled by default.

If you want to change this behaviour, we added a way to initialise the ServerSide module with additional information about the behaviour.
We have 3 behaviours:

	- PB_DEFAULT_BEHAVIOUR which is the one described just before
	- PB_ALWAYS_ENABLED which forces the ServerSide's module to always send information. This is used when you have tags that don't require consent.
	- PB_DISABLED_BY_DEFAULT which forces the ServerSide's module to disabled. It won't record hits before consent is given and you won't have any up by default time when using tagging the app loading screens. This is used when you're not using our Consent module.


Consent will then be forwarded inside the TCUser. For more information, please check documentation about the [Consent module](../TCConsent/README.md). 


To initialise the ServerSide with another behaviour, please call the following function:

in objective-c : 

```objc 
	ServerSide *tc = [[ServerSide alloc] initWithSiteID: andSourceKey: sourceKey siteID andDefaultBehaviour: PB_ALWAYS_ENABLED];
```

in swift : 

```swift
	let tc = ServerSide.init(siteID: siteID, andSourceKey: sourceKey, andDefaultBehaviour: PB_DEFAULT_BEHAVIOUR)
```

Background Mode
---------------

While the application is goind to background, the ServerSide's module sends all data that was already queued then stops. This is in order to preserve battery life and not use carrier data when not required.

But some applications need to be able to continue sending data because they have real background activities. For example listening to music.

For those cases, we added a way to bypass the way the ServerSide's module usually react to background. Please call:

in objective-c :

```objc
	[tc enableRunningInBackground];
```

in swift :

```swift
	tc?.enableRunningInBackground() 
```

One drawback is that we're not able to ascertain when the application will really be killed. In normal mode, we're saving all hits not sent when going in the background, which is not possible here anymore. To be sure to not loose any hits in background mode, we will save much more often the offline hits.

Please assure that your application has background modes enabled to use this feature.

Deactivating the ServerSide's module
--------------------

If you want to show a privacy message to your users allowing them to stop the tracking, you might want to use the following function to stop it if they refuse to be tracked.

in objective-c : 

```objc
	[TCS disableServerSide];
```

in swift : 

```swift
    tc.disableServerSide();
```

What this function does is stopping all systems in the ServerSide's module that update automatically or listen to notifications like background or internet reachability. This will also ignore all calls to the ServerSide's module by your application so that nothing is treated anymore and you don't have to protect those calls manually.

in objective-c : 

```objc 
	[TCS enableServerSide];
```

in swift : 

```swift
    tc. enableServerSide();
```
    
In the case you need to re-enable it after disabling it the first time, you can use this function.

Wait for User-agent
-------------------

As Apple removed the old class which allowed us to get the user-agent synchroneously, we sometimes have a bit of delay before the user-agent is available. And for unknown reasons, this delay is sometimes more than a minute on real devices.

If it is important for your solution to have acces to the user-agent, please call the following method:

```objc
	[TCS waitForUserAgent: YES];
```

When the user-agent is ready, it will be added to all the hit waiting to be sent.


Getting IDFA
------------

For privacy reason, the server-side module can't read and use the IDFA automatically. We need to first be sure that your user have accepted the corresponding category inside the privacy.


Also, if you are using iOS 14 or later, you have to display the system pop-up firs.

Since we don't know the flow of your application, you'll have to call the popup when you are ready to. You can check some code example here: https://medium.com/@nish.bhasin/how-to-get-idfa-in-ios14-54f7ea02aa42

and in the "case .authorized:", and the user accepted the related privacy category you can call:

	[ServerSideInstance addAdvertisingIDs];

This method will check and add if possible the IDFA, the IDFV and the boolean "is ad tracking enabled".



Firebase Destination
====================

You'll need to correctly set up Firebase SDK first into your app, please refer to the official firebase documentation to do so.
Once you have your firebase SDK running and your `google-services.json` into your app bundle, you only need to pass the firebase instance into your ServerSide instance initialisation. 


```
        tc = ServerSide.init(siteID: siteID, andSourceKey: sourceKey, andFirebaseInstance: Analytics.self)
```

Supported Firebase Event  
------------------------

We highly recommend only using TCCustomEvent when forwarding events to firebase. 
Make sure your events are compatible with firebase specifications to prevent any errors.

code example in swift : 

```swift
        let item_1: [String: Any] = [
            "item_id" : "1234",
            "item_name" : "XWU-1",
            "item_category" : "football",
            "item_variant" : "blue"
        ]
        
        let item_2: [String: Any] = [
            AnalyticsParameterItemID : "5678", // You can still use Firebase Constants
            AnalyticsParameterItemName : "ZPA-13",
            "item_category" : "basketball",
            "item_variant" : "orange"
        ]
         
        let items =  [item_1, item_2] as [Any]?
        let add_to_cart_event = TCCustomEvent(name: "add_to_cart")
        add_to_cart_event?.addAdditionalProperty("currency", withStringValue: "USD")
        add_to_cart_event?.addAdditionalProperty("value", withNumberValue: 30)
        add_to_cart_event?.addAdditionalProperty("items", withArrayValue: items)
        add_to_cart_event?.addAdditionalProperty("item_variant", withStringValue: "1234")
        add_to_cart_event?.addAdditionalProperty("price", withNumberValue: 1234)

        
        
        tc?.execute(add_to_cart_event)
```

Specs and requirements differ between TCEvents and Firebase Events, if you still want to use our TCEvents, you'll need to make sure that your TCEvents match Firebase recommendations too (required, allowed and non authorized parameters)
Events will be mapped like the following, and the TCServerSide will try and log the event to firebase.
You'll also need to configure every new parameter in your firebase console


|       TCEvent Property       |        Firebase Property     |
|------------------------------|------------------------------|
|  event.items[i].id           |  event.items[i].item_id      |
|  event.items[i].X            |  event.items[i].X            |
|  event.items[i].product.name |  event.items[i].item_name    |
|  event.items[i].product.X    |  event.items[i].tc_product_X | 

The predefined variables related to events (such as TCDevice and TCNetwork) aren't included in the Firebase event because they are already being gathered by Firebase SDK.

Troubleshooting
===============

The ServerSide also offers methods to help you with the Quality Assessment of the implementation.

Debugging
=========

We recommend using TCLogLevel_Verbose while developing your application:

in objective-c : 

```objc
	// Put it before the TagCommander initialization
	#ifdef DEBUG
		[TCDebug setDebugLevel: TCLogLevel_Verbose];
		[TCDebug setNotificationLog: YES];
	#end
```

in swift : 

```swift
	#if DEBUG
		TCDebug.setDebugLevel(TCLogLevel_Verbose)
		TCDebug.setNotificationLog(true)
	#endif        
```

- The first line allows you to select the verbosity of TagCommander's logs.

	- Verbosity

	Constant Name | Verbosity
	--------------|----------
	TCLogLevel_Verbose | Print everything.
	TCLogLevel_Debug | Most useful information for debugging.
	TCLogLevel_Info | Basic information about TagCommander's state.
	TCLogLevel_Warn | Warnings only.
	TCLogLevel_Error | Errors only.
	TCLogLevel_Assert | Asserts only.
	TCLogLevel_None | No print at all.

-   The internal architecture is working with internal notifications. You can ask the Logger to display all the internal notifications with setNotificationLog: YES.

Testing
-------

There are four ways to verify that the module executes the tags in your application:

 - By reading the debug messages in the console.
 - To check the interfaces inside the platform.
 - By going to your vendor's platform and check that the hits are displayed and that the data is correct. Please be aware that hits may not display immediately in the vendor account. This delay differs widely between vendors and may also vary for the type of hit under the same vendor.
 - You can also use a network monitor like Wireshark or Charles to check directly what is being sent on the wire to your vendors.

Common errors
-------------

![alt tag](../res/warning.png)

>  - Make sure you have the latest version.
>  - Enable the debug logs if you have any doubt.
>  - Check if TCServerSide is called when you think it should be. You should see it in the console logs or inside the monitoring interface.
>  - Make sure a second time that you have the latest version. (this really is the most common issue)
>  - Check all your IDs

Using a custom process pool
---------------------------

You might have issue with cookies stored in webviews and want to use a custom-process pool.
If you encounter this issue, you need to pass your custom process pool like to TCDebug class:

```swift
	+ (void) useCustomWKProcessPool: (BOOL);
```

This tells the SDK to wait before getting the user-agent to prevent cookie issues. If you do need to user-agent, you will need to manually call the following method in TCCoreVariables:

```swift
	- (void) initUserAgentWithProcessPool: (WKProcessPool *) pool;
```


Helpers
=======

Persisting variables
--------------------

ServerSide's module permits storing of variables that remain the same in the whole application, such as vendors ID, in a ServerSide's instance, instead of sending them each time you want to send data.

These variables will have a lower priority to the one given by the addData method but will persist for the whole run of the application.

in objective-c : 

```objc
	[self.ServerSideInstance addPermanentData: @"#VENDOR_ID#" withValue: @"UE-556XXXXX-01"];
	// They can also be removed if necessary.
	[self.ServerSideInstance removePermanentData: @"#VENDOR_ID#"];
```

in swift : 

```swift
	ServerSideInstance?.addPermanentData("#VENDOR_ID#", withValue: "UE-556XXXXX-01")
	// They can also be removed if necessary.
	ServerSideInstance?.removePermanentData("#VENDOR_ID#")
```

Swift
=====

If you want to use Swift as your main language, there is absolutely nothing special to do.
Compile with the latest versions and call our modules as usual.

Example: TCDemo
===============

To check an example of how to use this module, please check:

[TCDemo] (https://github.com/CommandersAct/TCMobileDemo-V5/tree/master/iOS)

Migration v4 to v5
==================

Why a new version of the SDK
----------------------------

CommandersAct made a big move forward to bring all his products together in a whole new platform.

As the mobile counterpart of all products we needed to re-work our SDKs in the same manner and create more logical connections with the whole suit.

We have renamed some modules to this end. SDK is now named ServerSide as it is only used to send information to our platform.
And TCPrivacy has been renamed to Consent since it is the name of our product inside our suit. And it is used to gather consent.

Event based
-----------

The biggest change as a user of the mobile SDK will to the way you send information to our servers.

Before you would create a big blob of data, fill it with anything needed or not even needed and send this.
We would then filter on the server-side this data and try to fill the tags with relevant information.

But as you may know, the previous server-side wouldn't allow much possibilities other than transferring the data.
With the new server-side you can rework your data in our interfaces and have more control over the data used by your solutions.

With this new version you will have to send "events".

An Event is a logical entity used by your other solutions (also named destinations) in a form that they can treat directly.
If you are using Facebook Conversion, you know that you can send "purchase" events for example which will be treated by our server-side to fit exactly what is needed by Facebook in this case.
This allow to be more precise and thus have less testing on both sides to know if what you send is indeed correctly used by your solution.

All custom events are defined on our online documentation including all parameters needed, all possible and their required formats.
Of course while using the ServerSide module, you can also check directly each event classes.

The hard part should not be for developers but for consulting which should re-organise all information currently sent in events.

Changes
-------

Many classes have been renamed, hopefully you'll only need 2 or 3 of them in your implementation.

Most notably: (module.classname)

```
    TCSDK/TagCommander -> TCServerSide/ServerSide
    TCPrivacy/TCMobilePrivacy -> TCConsent/TCMobileConsent
    TCPrivacy/TCPrivacyAPI -> TCConsent/TCConsentAPI
    TCPrivacy/TCPrivacyCenterViewController -> TCConsent/TCPrivacyCenterViewController
    TCPrivacy/TCIABPrivacyCenterViewController -> TCConsent/TCPrivacyCenterViewController
```

You don't need container ID anymore, all is on the same siteID. But you'll need a key specific to define the source.

You don't need to put any ServerSide instance in your Consent implementation anymore.

You might need to use the TCUser class to forward relevant information about your user.

Example
-------

in objective-c : 

```objc
    // Only sourceKey is new here, it's available on the platform and can be used to disable specific sources.
    int TC_SITE_ID = 29; // defines this site account ID
    NSString *sourceKey = @"NJtcKaoCYuZEFEzDSGZDxRgMBMUw==";

    ServerSide *TCS = [[ServerSide alloc] initWithSiteID: siteID andSourceKey: @"sourceKey" andDefaultBehaviour: PB_DEFAULT_BEHAVIOUR];
    
    // You can set in stone some information about your user and that will be sent with each events.
    [TCUser sharedInstance].email = @"superUser@gmal.coum";

    // Here an example of a purchase event with the item purchased.
    TCProduct *product = [[TCProduct alloc] initWithProductId: @"pID1" withName: @"some product" withPrice: [[NSDecimalNumber alloc] initWithFloat: 1.5f]];
    TCItem *item = [[TCItem alloc] initWithItemId: @"iID1" withProduct: product withQuantity: 1];
    TCPurchaseEvent *event = [[TCPurchaseEvent alloc] initWithId: @"ID" withRevenue: [[NSDecimalNumber alloc] initWithFloat: 1.1f] withValue: [[NSDecimalNumber alloc] initWithString: @"12.2"] withCurrency: @"EUR" withType: @"purchase" withPaymentMethod: @"CreditCard" withStatus: @"waiting" withItems: @[item]];

    [TCS execute: event];
```

in swift : 

```swift
        // Only sourceKey is new here, it's available on the platform and can be used to disable specific sources.
        let TC_SITE_ID = Int32(29); // defines this site account ID
        let sourceKey = "NJtcKaoCYuZEFEzDSGZDxRgMBMUw==";

        let TCS = ServerSide.init(siteID: TC_SITE_ID, andSourceKey: sourceKey, andDefaultBehaviour: PB_DEFAULT_BEHAVIOUR)

        // You can set in stone some information about your user and that will be sent with each events.
        TCUser.sharedInstance().email = "superUser@gmal.coum";

        // Here an example of a purchase event with the item purchased.
        let tc_product = TCProduct(productId: "pID1", withName: "some product", withPrice: 1.5)
        let tc_item = TCItem(itemId: "iID1", with: tc_product, withQuantity: 1)
        
        let event = TCPurchaseEvent.init(id: "ID", withRevenue: 1.1, withValue: 12.2, withCurrency: "EUR", withType: "purchase", withPaymentMethod: "CreditCard", withStatus: "waiting", withItems: [tc_item])

        TCS?.execute(event)
```        
        
And that's it!

Useful methods
--------------

You might have been using an ID to identify your user in v4. If you were using TC_IDFA or TC_SDK_ID or TC_NORMALIZED_ID nothing additional to do.

But if you were using TC_UNIQUEID you can push this ID instead of the new one for either:
    
```
    - the consentID which is used to push consent inside the dashboards
    - the user anonymousID which is used the same way as the TCID in the web
```

we have 2 methods for that, both are in TCPredefinedVariables:

```
    - (void) useLegacyUniqueIDForAnonymousID;
    - (void) useLegacyUniqueIDForConsentID;
```
Support and contacts
====================
![alt tag](../res/ca_logo.png)

***
**Support**
*support@commandersact.com*

http://www.commandersact.com
***

This documentation was generated on 19/02/2026 14:12:03

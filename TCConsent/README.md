![alt tag](../res/ca_logo.png)

Consent's Implementation Guide
==============================

Last update : *19/02/2026*

Release version : *5.3.8*

## Table of Contents

- [Consent's Implementation Guide](#consents-implementation-guide)
- [Introduction](#introduction)
- [Choose your privacy](#choose-your-privacy)
- [Setup](#setup)
  - [With the ServerSide](#with-the-serverside)
  - [Standalone](#standalone)
- [Saving consent](#saving-consent)
  - [With the Privacy Center](#with-the-privacy-center)
  - [Manually displayed consent](#manually-displayed-consent)
  - [Forwarding to Server-Side](#forwarding-to-server-side)
  - [AcceptAll / RefuseAll](#acceptall-refuseall)
- [Retaining consent](#retaining-consent)
  - [Using your own user ID](#using-your-own-user-id)
  - [Displaying chosen ID](#displaying-chosen-id)
- [Displaying consent](#displaying-consent)
- [Reacting to consent](#reacting-to-consent)
  - [Resetting consent](#resetting-consent)
- [Forwarding consent to webViews](#forwarding-consent-to-webviews)
- [Forwarding consent to FirebaseAnalytics, setting-up GCM](#forwarding-consent-to-firebaseanalytics-setting-up-gcm)
  - [Debug Google Consent Mode :](#debug-google-consent-mode)
- [Changing consent version](#changing-consent-version)
- [Consent internal API](#consent-internal-api)
- [Privacy Center](#privacy-center)
- [Privacy statistics](#privacy-statistics)
- [Stop privacy stats tracking](#stop-privacy-stats-tracking)
- [TCDemo](#tcdemo)

Introduction
============

The Consent module can be used in a lot of different ways, after this short introduction, you will find links to each of the different ways and their specific documentations.

Having the user consent is essential to send sensible information like the IDFA/AAID or using any personal information to serve advertising.

We created this module to simplify the management of your user's privacy and the way to use it.


This module can:

    - Display a consent page (if needed)
    - Save consent inside the phone and reload it every time the application is launched.
    - Check the validity of the consent. The validity duration is set to 6 months by default.
    - Send a hit to our servers to record the consent. For statisical purposes.
    - Save the consent String (if used alongside IAB)
    - Enable or disable the ServerSide. (if used alongside the ServerSide module)
    - Add the categories automatically to the hits the ServerSide sends. (if used alongside the ServerSide module)
    - Forward the consent to the developpers if they need it outside of the module.


Choose your privacy
===================

Consent comes with two major flavors:

    - With Tag Management (With ServerSide)
    - Standalone

And 3 different ways to display it:

    - Manually and then forwarding us the information
    - Using our Privacy Center for IAB version 2
    - Using our Privacy Center for simple Consent solution

If you're unsure of which one you should use, please contact the person in charge of your account.

[To use IAB V2 please see here](../TCIAB/README.md)


Setup
=====

/!\ If you are using our interface, you need to have a version of privacy.json inside your project. This will prevent any issues with users with bad or no internet at all. If you are using IAB please also take vendor-list.json and the translation file purposes-fr.json.
If you are not using our interface, you can't use our privacy.json, if you want a way to use a configuration file, please ask your dev team to manage this file.

After initialisation the Consent module will check the consent validity. If the consent is too old a callback will be called. Please check the Callback part.
The default value is 6 months.

If you're using our interface, and thus our privacy.json, you can change the duration on this validity.
To do this, add "consentDurationInMonths": "13" inside the "information" bloc.

If you're not using our interface, you'll have to manually change it in the code.
We express this duration in months. The duration of a month is calculated by 365/12 days.
Please first call the following method before initializing the Consent module else:

```objc
    [[TCMobileConsent sharedInstance] setConsentDuration: 13];
```

in swift : 

```swift
    TCMobileConsent.sharedInstance().consentDuration = 13
```

With the ServerSide
-------------------

Modules: Core, Consent, ServerSide

This module can use the same model you are using on the web, if you do so, please start by getting the IDs of the categories you are going to use.
Join those IDs with a "consent version". Default is 1, but if you change the implementation, increment this version.

The setup is really simple, pass to the TCMobileConsent object your site ID and privacy ID. If you want to add your consent version, you can add it to the parameters as a NSString.
in objective-c : 

```objc
    [[TCMobileConsent sharedInstance] setSiteID: siteID andPrivacyID: privacyID];
```

in swift : 

```swift
    TCMobileConsent.sharedInstance().setSiteID(siteID, andPrivacyID: privacyID)
```

If you're using you're own Privacy Center, use the following function instead:

in objective-c : 

```objc
    [[TCMobileConsent sharedInstance] customPCMSetSiteID: siteID andPrivacyID: privacyID];
```
in swift : 

```swift
    TCMobileConsent.sharedInstance().customPCMSetSiteID(siteID, andPrivacyID: privacyID)
```

This call will check the saved consent, putting the SDK on hold if nothing is fount, and start/stop the SDK if something is saved.
It will then the check the consent validity, if it's too old, you can implement a callback treating what to do then. Please check the Callback part.

Please note that start and stop have a notification sent with them, you can listen to them if needed: kTCNotification_EnablingTheServerSide and kTCNotification_StoppingTheServerSide.

If you need to store configuration files in another bundle than the main one, you can call the following line:

It must be called _before_ calling any [TCMobileConsent sharedInstance].

in objective-c : 

```objc
	[[TCConfigurationFileFactory sharedInstance] setBundle: myBundle forConfiguration: @"vendorlist"];
```
in swift : 

```swift
	TCConfigurationFileFactory.sharedInstance().setBundle(myBundle, forConfiguration: "vendorlist")
```

Standalone
----------

Modules: Core, Consent

You won't need the ServerSide module, and will need to implement a callback to manage your solutions when consent is given or re-loaded.

The setup is really simple, pass to the TCMobileConsent object your site ID  and privacyID.

in objective-c : 

```objc
    [[TCMobileConsent sharedInstance] setSiteID: siteID andPrivacyID: privacyID];
```

in swift : 

```swift
    TCMobileConsent.sharedInstance().setSiteID(siteID, andPrivacyID: privacyID)
```

If you're using you're own Privacy Center, use the following function instead:

in objective-c : 

```objc
    [[TCMobileConsent sharedInstance] customPCMSetSiteID: siteID andPrivacyID: privacyID];
```

in swift : 

```swift
    TCMobileConsent.sharedInstance().customPCMSetSiteID(siteID, andPrivacyID: privacyID)
```

Saving consent
==============

Here is where the IDs of the categories matters.

With the Privacy Center
-----------------------

If you're using the Privacy Center, nothing has to be done here, it will automatically propagate the consent to all other systems. And the ID will be the one used in the configuration file. Please check the Privacy Center part for more information.

Please keep your category IDs between 1 and 999.

Manually displayed consent
--------------------------

Once the user validated his consent, you can then send the information to the Consent module as follows:
in objective-c : 

```objc
    NSMutableDictionary *consent = [[NSMutableDictionary alloc] initWithCapacity: 3];
    [consent setObject: @"1" forKey: @"PRIVACY_CAT_1"];
    [consent setObject: @"0" forKey: @"PRIVACY_CAT_2"];
    [consent setObject: @"2" forKey: @"PRIVACY_CAT_3"];
    [[TCMobileConsent sharedInstance] saveConsent: consent fromConsentSource: Popup withPrivacyAction: Save];
```

ETCConsentSource is either "Popup" or "PrivacyCenter".

ETCConsentAction is either "AcceptAll", "RefuseAll", "Save"

in swift : 

```swift
    let consent = ["PRIVACY_CAT_1" : "1", "PRIVACY_CAT_2" : "0", "PRIVACY_CAT_3" : "2"];
    TCMobileConsent.sharedInstance().save(consent, from: ETCConsentSource.Popup, withPrivacyAction: ETCConsentAction.Save)
```

Please prefix your category IDs with "PRIVACY_CAT_" and your vendor IDs with "PRIVACY_VEN_.

The value expected are:

- 1 means accepting this category or vendor.
- 2 is for mandatory vendors or categories.
- 0 is refusing.

Source can be either:
- Popup
- PrivacyCenter

And consent action:
- AcceptAll
- RefuseAll
- Save

If you're using the ServerSide, this will propagate the information to the TCServerSide and the TCUser and manage its state.

If you are using mandatory categories (categories that can't be opted out), you can use refuse all and pass those categories with "2".

Forwarding to Server-Side
-------------------------

Only if you use Server-Side and a consent manually displayed and consent external to our platform. 
Otherwise, everything is done automatically, so nothing to do here.

You will need to add consent to the TCUser object to forward it to our server-side.

in objective-c : 

```objc
    NSMutableDictionary *ext = [[NSMutableDictionary alloc] init];
    [ext setValue: @"true" forKey: @"key01"];
    [ext setValue: @"1" forKey: @"key02"];
    [ext setValue: @"3" forKey: @"312"];
    [[TCUser sharedInstance] setExternalConsent: ext];
```

in swift : 

```swift
    let ext = ["key01" : "true", "key02" : "1", "312" : "3"];'
    TCUser.sharedInstance().setExternalConsent(ext)
```

Since it's external, and we don't really know how it's working, you can pass any string/string and we'll forward it as is.

AcceptAll / RefuseAll
---------------------

/!\ Those methods only work if you are using our interface and thus have a privacy.json in your project (and maybe IAB's JSON as well).

Those are intended for clients that are displaying a first "popup" screen before our interfaces and that have a way to either open the privacy center of accept/refuse the consent.

We created functions to call if you want to create a simple way to accept or refuse all consent from outside our user interface.

objective-c :

```objc
	[[TCMobileConsent sharedInstance] acceptAllConsent];
	[[TCMobileConsent sharedInstance] refuseAllConsent];
```

in swift : 

```swift
	TCMobileConsent.sharedInstance().acceptAllConsent()
	TCMobileConsent.sharedInstance().refuseAllConsent()
```

Retaining consent
=================

The saving of the consent on our servers is done automatically.

But since we are saving the consent in our servers, we need to identify the user one way or another. By default, the variable used to identify the user consenting is #TC_SDK_ID#, but you can change it to anything you'd like.

If you're looking for a way to prove consent or reset saved information, you'll need to create a specific screen in app for this.

This can be used to save the display of the consent, and giving the consent.

This ID is very important because it will be the basic information used to get back the consent when you need a proof.

Using your own user ID
----------------------

You will be able to get the information more easily since this is an ID available by several means for you.

You will be able to get the information more easily since this is an ID available by several means for you.
To modify the ID used for saving the consent, you can change the information inside the TCUSer.

in objective-c :

```objc
	[TCUser sharedInstance].consentID = @"myConsentID";
```

in swift :
 
```swift
	TCUser.sharedInstance().consentID = "myConsentID"
```

Displaying chosen ID
-------------------- 

You might want to be able to display to your end user the ID used to save the consent. You can simply get it like this:

```objc 
    [TCUser sharedInstance].consentID
```

Displaying consent
==================

If you are familiar with Commanders Act Consent for web, you know that we actually record two things. The first thing is "displaying the consent form".
This allows you to prove that a user has indeed been shown the consent screen even if he somehow left without accepting/refusing to give his consent.

In some cases, client also use this to infer user consent since he continued using the application after he was shown the consent screen.
We don't recommend this behaviour, please discuss it with your setup team first.

Reacting to consent
===================

If you need to react to the user giving consent, or the loading of the consent at the start of the Consent module we created several callbacks to help.

Currently, we have a callback function that lets you get back the categories and set up your other partners accordingly.
This is the function where you would tell your ad partner "the user don't want to receive personalized ads" for example.

> [!WARNING]  
> Don't forget to register to the callbacks *before* the initialisation of the Consent Module since the module will check consent at init and use the callback at this step.

Implement TCPrivacyCallbacks to get access to those callbacks:

```objc 
	- (void) consentUpdated: (NSDictionary *) consent;
```

Called when you give us the user selected consents, or when we load the saved consent from the SDK.
We have a Dictionnary which is the same as the one given to our SDK with keys PRIVACY_CAT_n and value @"0" or @"1".

```swift
	- (void) consentOutdated;
```

This is called after 13 months without change in the user consent. This can allow you to force displaying the consent the same way you would on first launch.

```swift
	- (void) consentCategoryChanged;
```

When you make a change in the JSON, there is nothing special to do.
But when this change is adding or removing a category, or changing an ID, we should re-display the Privacy Center.

```swift
	- (void) significantChangesInPrivacy;
```

This one is slightly different from the last one, it was created for IAB and will not be sent automatically. It is conditionned by the field "significantChanges" in the privacy.json so that it will only launch when you need it to.


Resetting consent
-----------------

To reset user consent on devices, you can use the following method:

```objc
        TCMobileConsent.sharedInstance().resetSavedConsent()
```

Please note that this method resets the consent on the device each time it is called. If you need to handle resets for specific app versions, you will have to manage that manually.

Alternatively, if you are using our PrivacyCenter, you can use the resetSave field in your privacy.json. For implementation details, please contact your consultant.

Forwarding consent to webViews
==============================

Some clients need to have the consent forwarded in their webViews to manage a web container inside it.
We created a function to get the privacy as a JSON string so you can save it inside the webView's local storage.
/!\ This function only help to save it to the local storage by giving the required format, you will still need to have JS code in the web container to use it. Please ask your consultant for this part.

```objc
	- (NSString *) getConsentAsJson;
```

Forwarding consent to FirebaseAnalytics, setting-up GCM
=======================================================

If you want to use our TCConsent to collect and set your Google Consent Mode, you can configure the TCConsent module to forward and set the consent to FirebaseAnalytics once the user has opted-in/out for your mapped categories. 

To do so, make sure FirebaseAnalytics library is added and correctly configured into your project (check Google documentation). 
Then add the following section to the root of your privacy.json : 

```
    "google_consent_mode": {
        "use_consent_mode": true, // boolean value to activate the mapping
        "infer_ad_from_tcf": false, // boolean value for default IAB mapping
        "category_mapping": { // Custom categories ID mapping only
            "ad_storage": 1, 
            "ad_user_data": 2,
            "ad_personalization": 3,
            "analytics_storage": 4
        }
    }
```

You will need to implement the firebaseConsentChanged callback in your TCPrivacyCallbacks with the following code : 

```swift 
import FirebaseCore

class MyPrivacyCallbacks : NSObject, TCPrivacyCallbacks
{

// other code & callbacks


    func firebaseConsentChanged(_ firebaseConsent: [String : NSNumber]!) 
    {
        if let analytics_storage_consent = firebaseConsent["analytics_storage"]?.boolValue{
            Analytics.setConsent([.analyticsStorage: analytics_storage_consent ? .granted : .denied])
        }
        
        if let ad_storage_consent = firebaseConsent["ad_storage"]?.boolValue{
            Analytics.setConsent([.adStorage: ad_storage_consent ? .granted : .denied])
        }
    
        if let ad_user_data_consent = firebaseConsent["ad_user_data"]?.boolValue{
            Analytics.setConsent([.adUserData: ad_user_data_consent ? .granted : .denied])
        }
        
        if let ad_personalization_consent = firebaseConsent["ad_personalization"]?.boolValue{
            Analytics.setConsent([.adPersonalization: ad_personalization_consent ? .granted : .denied])
        }
    }
}
```

Now register your callbacks and set TC_GCM_DEVELOPER_ID value for developer_id key in your firebaseDefaultParameters all before initializing your TCConsent module  : 

```swift
        firebaseAnalytics.setDefaultEventParameters("developer_id", TC_GCM_DEVELOPER_ID)
        TCMobileConsent.sharedInstance().callback = MyPrivacyCallbacks()
        TCMobileConsent.sharedInstance().setSiteID(siteID, andPrivacyID: privacyID)
```

Debug Google Consent Mode :
---------------------------

Once Consent is collected, you can look into firebase logs on Xcode console directly for new GCM categories consent values, more info [here](https://developers.google.com/tag-platform/security/guides/app-consent?platform=ios).

Changing consent version
========================

If the case you need to manually change the consent version (if you're using your own privacy center for example), you can use the following:

in objective-c : 

```objc
    [[TCMobileConsent sharedInstance] setConsentVersion: @"132"];
```
in swift : 

```swift
        TCMobileConsent.sharedInstance().consentVersion = "132"
```

Consent internal API
====================

We created several methods to check given consent. They are simple, but make it easier to work with consent information at any given time.
You'll find those in the class TCConsentAPI:


```objc
    /**
     * Checks if we should display privacy center for any reason.
     * @return True or False.
     */
    + (BOOL) shouldDisplayPrivacyCenter

    /**
     * Checks if consent has already been given by checking if consent information is saved.
     * @return YES if the consent was already given, NO otherwise.
     */
    + (BOOL) isConsentAlreadyGiven;

    /**
     * Return the epochformatted timestamp of the last time the consent was saved.
     * @return epochformatted timestamp or 0.
     */
    + (unsigned long long) getLastTimeConsentWasSaved;

    /**
     * Check if a Category has been accepted.
     * @param ID the category ID.
     * @return YES or NO.
     */
    + (BOOL) isCategoryAccepted: (int) catID;

    /**
     * Check if a vendor has been accepted.
     * @param ID the vendor ID.
     * @return YES or NO.
     */
    + (BOOL) isVendorAccepted: (int) venID;

    /**
     * Get the list of all accepted categories.
     * @return a List of PRIVACY_CAT_IDs.
     */
    + (NSArray<NSString *> *) getAcceptedCategories;

    /**
     * Get the list of all accepted vendors.
     * @return a List of PRIVACY_VEN_IDs.
     */
    + (NSArray<NSString *> *) getAcceptedVendors;

    /**
     * Get the list of everything that was accepted.
     * @return a List of PRIVACY_VEN_IDs and PRIVACY_CAT_IDs.
     */
    + (NSArray<NSString *> *) getAllAcceptedConsent;

    /**
     * Check if a purpose has been accepted.
     * @param ID the purpose ID.
     * @return YES or NO
     */
    + (BOOL) isIABPurposeAccepted: (int) ID;

    /**
     * Check if a vendor has been accepted.
     * @param ID the vendor ID.
     * @return YES or NO
     */
    + (BOOL) isIABVendorAccepted: (int) ID;

    /**
     * Check if a special feature has been accepted.
     * @param ID the vendor ID.
     * @return YES or NO
     */
    + (BOOL) isIABSpecialFeatureAccepted: (int) ID;

    /**
     * Get the list of all google vendor accepted.
     * @return a list of acm_IDs.
     */
    + (NSArray <NSString *> *) getAcceptedGoogleVendors;
```

Privacy Center
==============

The Privacy Center is represented by a JSON file that describes the interfaces that will be created by native code inside the application.

For now this JSON has to be created and managed manually. An offline version is mandatory inside the app and if you need to update it remotely you can have another version on our CDNs.
The module will check for updates of the file automatically.

Your account should have a consultant that will provide you the corresponding JSON for your project.

We create an UIViewController to create the privacy center view.
The offline JSON should be inside the project code folder.

```objc
    TCPrivacyCenterViewController *PCM = [[TCPrivacyCenterViewController alloc] init];
    [self.navigationController pushViewController: PCM animated: YES];
```

Since we have a view controller, you can call it by pushing it. It's quite easy.

Some part of the Privacy Center can be customised with your code.

### Change the default state of the switch button to disabled:

in objective-c : 

```objc 
	[TCMobileConsent sharedInstance].switchDefaultState = NO;
```

in swift : 

```swift
	TCMobileConsent.sharedInstance().switchDefaultState = true
```

Privacy statistics
==================

We have dashboards that allow to have detailed statistics on the choices your users are making.
Depending on your app privacy configuration you might have to call some additional functions.

```
    - Custom « banner/popup » -> our privacy center
    - Custom « banner/popup » -> Custom privacy center
    - Directly to our privacy center
    - Custom privacy center
```
Whenever saveConsent* is called you will need to provide the full list of purposes and vendors that have been consented to and refused.

We reworked saveConsent methods to only use one. If you are using the old functions they will still work for now.
Otherwise, please check the above section "Manually displayed consent" for how this method works.


> [!WARNING]  
> Also, please note that you will need to call **statViewBanner** when you display your custom banner.

![alt tag](../res/TCPC_customBanner.jpeg)
![alt tag](../res/TCPC_PC.jpeg)
![alt tag](../res/CustomBanner.jpeg)
![alt tag](../res/CustomPC.jpeg)


Copy/paste-able list of functions for our interfaces:

in objective-c :

```objc	[[TCMobileConsent sharedInstance] refuseAllConsent];
	[[TCMobileConsent sharedInstance] acceptAllConsent];
	[[TCMobileConsent sharedInstance] statEnterPCToVendorScreen];
	[[TCMobileConsent sharedInstance] statViewPrivacyPoliciesFromBanner];
	[[TCMobileConsent sharedInstance] getNumberOfIABVendors];
```

in swift :

```swift
    TCMobileConsent.sharedInstance().refuseAllConsent()
    TCMobileConsent.sharedInstance().acceptAllConsent()
    TCMobileConsent.sharedInstance().statEnterPCToVendorScreen()
    TCMobileConsent.sharedInstance().statViewPrivacyPoliciesFromBanner()
    TCMobileConsent.sharedInstance().getNumberOfIABVendors()
```

Copy/paste-able list of functions for custom interfaces:

in objective-c :

```objc
	[[TCMobileConsent sharedInstance] saveConsent: (NSDictionary *) consent fromConsentSource: (enum ETCConsentSource) source withPrivacyAction: (enum ETCConsentAction) action];
	[[TCMobileConsent sharedInstance] statEnterPCToVendorScreen];
	[[TCMobileConsent sharedInstance] statViewPrivacyPoliciesFromBanner];
	[[TCMobileConsent sharedInstance] statViewPrivacyPoliciesFromPrivacyCenter];
	[[TCMobileConsent sharedInstance] statViewPrivacyCenter];
	[[TCMobileConsent sharedInstance] statShowVendorScreen];
```

in swift :

```swift
        TCMobileConsent.sharedInstance().save([AnyHashable : Any]!, from: ETCConsentSource, withPrivacyAction: ETCConsentAction)
        TCMobileConsent.sharedInstance().statEnterPCToVendorScreen()
        TCMobileConsent.sharedInstance().statViewPrivacyPoliciesFromBanner()
        TCMobileConsent.sharedInstance().statViewPrivacyPoliciesFromPrivacyCenter()
        TCMobileConsent.sharedInstance().statViewPrivacyCenter()
        TCMobileConsent.sharedInstance().statShowVendorScreen()
```

Stop privacy stats tracking
===========================

You can set your `do_not_track` property on your privacy stats payload :

```objc
        [TCMobileConsent sharedInstance].do_not_track = value;
```

TCDemo
======

You can, of course, check our demo project for a simple implementation example.

[TCDemo_ServerSide_And_Consent](https://github.com/CommandersAct/TCMobileDemo-V5/tree/master/iOS/)

Support and contacts

![alt tag](../res/ca_logo.png)

***
**Support**
*support@commandersact.com*

http://www.commandersact.com

Commanders Act | 7b rue taylor - 75010 PARIS - France
***

This documentation was generated on 19/02/2026 14:12:03

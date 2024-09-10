Changelog iOS
=============

*5.3.3 : 09/10/2024*

	~ [IAB] Updated possible languages for IAB translation.

*5.3.2 : 06/04/2024*

    ~ Fix bug on TCConsentAPI.isIABSpecialFeatureAccepted() that always returns flase.

*5.3.1 : 05/06/2024*

    - Removing tracking URL from privacy manifest as it doesn't concern ads.

*5.3.0 : 04/22/2024*

    - [TCConsent_IAB removed] Unified TCConsent variant for both IAB & non-IAB users (Requires TCCore 5.4.0+ && TCIAB 5.1.0+).

*5.2.1 : 03/04/2024*

    ~ Vendors details drop-down may crash on closing fix.
    + Added privacy manifest file.
    ~ Fixed Layout Constraints warnings on purposes screen.
    ~ Illustrations button not always displayed fixed on purposes screen.

*5.2.0 : 01/31/2024*

	+ Added Google Consent Mode (Requires TCCore 5.3.3+).

*5.1.11 : 01/08/2024*

    ~ Fix policyVersion to 4 for IAB v2.2.

*5.1.10 : 12/08/2023*

    + Pushing consent version to CoreVariable to use it (Requires TCCore 5.3.2+)
    ~ Added logs when bad TCMobileConsent initialization.

*5.1.9 : 10/19/2023*

    ~ [IAB] illustrations fix on privacy center.
    - [IAB] Remove consentOutdated callback when migrating to iabv2.2.
    + [IAB] Added a function to get the number of IAB vendors.

*5.1.8 : 09/26/2023*

    ~ added missing function "urlButtonAction" for nonIAB privacyCenter

*5.1.7 : 07/24/2023*

    - /!\ Requires Core 5.2.5+
    + Support IAB TCF v2.2

*5.1.6 : 05/09/2023*

    + Adding do_not_track property for privacy stats

*5.1.5 : 04/20/2023*

    + [IAB] As per legal request displaying the number of IAB vendors used in the bottom of the first consent screen.
    ~ Changing weight of consent duration sources. Now we have : "SDK default value" < "Value in json" < "setConsentDuration()"
    ~ Fixing an issue to switch the language to english when it's not the default language.


*5.1.4 : 03/22/2023*

    + Added the version of the Consent module inside the consent hits to help debug.

*5.1.3 : 12/08/2022*

	- Removed bitcode variants


*5.1.2 : 09/28/2022*

	~ [IAB] Added drop-down to show vendors disclosures.


*5.1.1 : 08/04 2022*

    ~ Fixing some stats where we would loose the click information for a consent status.


*5.1.0 : 05/24 2022*

    ~ Changed the payload of the consent statistics sent to our servers for better statistics.
    ~ fixed memory leak on TCPrivacyCenterViewController.
    ~ [IAB] Modified consent string timestamp to comply with new TCF standards of reducing precision.
    ~ [IAB] fixing cmpVersion bug in generated TCF consent string.
    ~ fixed default switch states not working anymore.
    + added TCUser.consentID on the purposes screen.

*5.0.0 : 03/28 2022*

	~ Renaming Module to Consent and TCMobilePrivacy to TCMobileConsent.
	~ Renaming of many other classes and some methods (see documentation for an easy migration)
	- Removed the need to pass the instance of ServerSide (previously TagCommander) to automatically forward consent.
	- Removed many constructors for TCMobileConsent (previously TCMobilePrivacy) since we don't need containerID anymore.

*4.9.4 : 06/10 2021*

	+ Mandatory custom categories supported on Privacy Center.
	~ Fixing a resetSave issue with AC-String.


*4.9.3 : 09/29 2021*

	+ Fixing the display of very long url on the purpose page.


*4.9.2 : 09/13 2021*

	+ New function to easily get the ID used to save privacy.


*4.9.1 : 09/02 2021*

    ~ Quick fix for regular privacy which only worked with "with-IAB" type of releases.


*4.9.0 : 08/10 2021*

	+ Privacy Center unified for IAB and Non-IAB users.
    + We can now build Google AC-String.
	~ Fixing accept all which always sent stats from "banner"
	+ Adding missing stat function "saveConsentFromPopUp"

*4.8.5 : 05/06 2021*

	+ New statistics functions. Please check TCPrivacy documentation on github.

*4.8.4 : 04/19 2021*

	/!\ We changed the version number to prevent cache issues.
	~ Same as 4.8.4 but rebuilt with another XCode version.

*4.8.3 : 04/15 2021*

	/!\ Requires TCCore 4.7.5 or higher
	~ [IAB][Standalone] Fixing issue with consentString date when not using the SDK Module.

*4.8.2 : 04/12 2021*

	~ [IAB] Fixing issue with acceptAll on banner which only saved what vendors needed for the consent string and not for the interface.
	~ [IAB] Forcing uppercase in consent string language and country code.

*4.8.1 : 03/08 2021*

	~ Fixing issue when using IAB without custom vendors and still having the need to ask for custom vendors order inside privacy.json
	+ [IAB] managing changes in vendor-list.json format. We can now have null values for cookieMaxAgeSeconds.

*4.8.0 : 02/23 2021*

    + [IAB] Added functions in TCPrivacyAPI to query IAB consent without manually offsetting the IDs.
    + [IAB] Allowing to use custom purposes and vendors alongside IAB
    ~ Fixing purposes validating vendors but not the one who have it in legitimate interest.

*4.7.10 : 01/30 2021*

	~ [IAB] Fixing issues on the vendors drop-down displaying wrong information.
	+ [IAB] Adding support for IAB 2.1. Please read the documentation as you will need to update your privacy.json

*4.7.9 : 01/25 2021*

	~ [IAB] Fixing an issue with acceptAllConsent when either using all vendors from the IAB list of when adding more vendors in the privacy.json.

*4.7.8 : 01/14 2021*

	~ Fixing timeofconsent which was called everytime we would activate the SDK.
	~ Fixing callback protection on consentOutdated

*4.7.7 : 01/12 2021*

	~ [IAB] Modified CMP version as IAB can only encore it on 12 bits
	~ Modified consent duration to float so we can test it with verrrrry small values.
	+ Added public version of the string ConsentVersion to use in custom interface.

*4.7.6 : 12/18 2020*

	~ Updated special features offsets to match web format.
	~ Modified build scripts to better handle XCFramework. No more debug needed, DSYM files are now directly inside the release.

*4.7.5 : 12/14 2020*

    + Added getConsentAsJson method to help forward consent information to the WebView.
    + Added a way to change consent validity duration please check documentation.

*4.7.4 : 12/04 2020*

	~ Rectoring of consent waiting to be saved. Preventing the loss of special features and sometimes legitimate interest.
	+ [IAB] vendor interface is now as fast as it should be.
	+ Fixing greyed button issue on iPad.

*4.7.3 : 11/16 2020*

	+ [iAB] We now validate vendors corresponding to selected purposes.

*4.7.2 : 10/30 2020*

	~ [IAB] Corrected the accept all function which was saving too many vendors and miss-saving special features and first purpose.
	~ [IAB] Corrected the purposes buttons which didn't remove legitimate interest.

*4.7.1 : 10/16 2020*

	~ [IAB] Correcting display issue on iOS 11 and before.
	+ [IAB] Forcing separation between "related vendors" and "legal information" to avoid collision when texts are changed.

*4.7.0 : 10/06 2020*

	+ Building for iOS 14.

*4.6.17 : 03/02*

	~ Fixing issue when using IAB without custom vendors and still having the need to ask for custom vendors order inside privacy.json
	+ [IAB] managing changes in vendor-list.json format. We can now have null values for cookieMaxAgeSeconds.

*4.6.16 : 02/23*
    + [IAB] Added functions in TCPrivacyAPI to query IAB consent without manually offsetting the IDs.
    + [IAB] Allowing to use custom purposes and vendors alongside IAB
    ~ Fixing purposes validating vendors but not the one who have it in legitimate interest.

*4.6.15 : 01/30 2021*

	~ [IAB] Fixing issues on the vendors drop-down displaying wrong information.
	+ [IAB] Adding support for IAB 2.1. Please read the documentation as you will need to update your privacy.json

*4.6.14 : 01/25 2021*

	~ [IAB] Fixing an issue with acceptAllConsent when either using all vendors from the IAB list of when adding more vendors in the privacy.json.

*4.6.13 : 01/14 2021*

	~ Fixing timeofconsent which was called everytime we would activate the SDK.
	~ Fixing callback protection on consentOutdated

*4.6.12 : 01/12 2021*

	~ [IAB] Modified CMP version as IAB can only encore it on 12 bits
	~ Modified consent duration to float so we can test it with verrrrry small values.
	+ Added public version of the string ConsentVersion to use in custom interface.

*4.6.11 : 12/18 2020*

	~ Updated special features offsets to match web format.

*4.6.10 : 12/14 2020*

    + Added getConsentAsJson method to help forward consent information to the WebView.
    + Added a way to change consent validity duration inside privacy.json.

*4.6.9 : 12/04 2020*

	~ Rectoring of consent waiting to be saved. Preventing the loss of special features and sometimes legitimate interest.
	+ [IAB] vendor interface is now as fast as it should be.
	+ Fixing greyed button issue on iPad.

*4.6.8 : 11/16 2020*

	+ [iAB] We now validate vendors corresponding to selected purposes.

*4.6.7 : 10/30 2020*

	~ [IAB] Corrected the accept all function which was saving too many vendors and miss-saving special features and first purpose.
	~ [IAB] Corrected the purposes buttons which didn't remove legitimate interest.

*4.6.6 : 10/16 2020*

	~ [IAB] Correcting display issue on iOS 11 and before.
	+ [IAB] Forcing separation between "related vendors" and "legal information" to avoid collision when texts are changed.

*4.6.5 : 10/06 2020*

	~ Correcting first IAB purpose which was saved as consent and legitimate interest. The first purpose can't have legitimate interest.

*4.6.4 : 09/21 2020*

	+ Adding methods to enter the IAB Privacy center directly on the purpose screen or on the vendor screen. Please check documentation.
	+ Functions used to accept or refuse all consent without entering the Privacy Center.
	~ Preventing the callbacks from bring called if the class used is not implementing them.

*4.6.3 : 09/07 2020*

	+ Added a way to choose which buttons to have on first and second layer (IAB interface). Please check TCIAB documentation for further details.
	- Removed URL-encoding for the statistic hits parameters which was not needed anymore.

*4.6.2 : 08/27 2020*

	+ New method in TCPrivacyAPI : TCShouldDisplayPrivacyCenter. /!\ Beware that if you need to use this method, you might need to re-display the first time.
	~ Corrected an issue with buttons not working on modal view
	~ Corrected an issue with accept all and Refuse all buttons staying disabled on iPads.
	~ corrected an issue when link to vendor screens would not work

*4.6.1 : 08/07 2020*

	~ corrected missing IAB constant in some variants of the TCPrivacy module builds.

*4.6.0 : 07/30 2020*

	+ Interface based on IAB TCF v2 framework can now be used alongside TCIAB's module.

*4.5.8 : 05/11 2020*

	~ Corrected TCPrivacyAPI getAcceptedCategories and getAcceptedVendors which tested presence in sharedPref and not values.
	~ Corrected Privacy Center category title to allow multi-lines.

*4.5.7 : 04/02 2020*

	~ Removed useless delegates on UIView which is deprecated.

*4.5.6 : 03/30 2020*

	~ /!\ Those modifications are only needed when working with IAB version 1, if you need them also update TCIAB to 4.4.3+.
	~ Corrected the consent Time_created and Time_updated which were inverted.
	~ Corrected the Time_created value.

*4.5.5 : 03/26 2020*

	~ Activating and Disabling the SDK now saves the kTCPrivacyConsent to 1 or 0 before sending the kTCNotification_StartingTheSDK or kTCNotification_StoppingTheSDK notifications.

*4.5.4 : 02/19 2020*

	+ Added LICENCE.md in release zips to allow cocoapods to read it automatically.

*4.5.3 : 01/13/2020*

	~ Issue on TCPrivacyAPI header not visible.

*4.5.2 : 12/19 2019*

	~ corrected empty Vendor list due to prefix parsing error.

*4.5.1 : 12/19 2019*

	~ The variable userID used to specify a specific userID for privacy was not initialised to nil leading to hazardous behaviours.

*4.5.0 : 12/18 2019*

	- Removing armv7s support.
	+ Added an API class to check the content or status of the consent. Please check the TCPrivacy documentation on github.

*4.4.5 : 11/11 2019*

	+ Changing the switch tint color.

*4.4.4 : 10/29 2019*

	+ All the switch positions of the Privacy Center can now default to the off position by using : [TCMobilePrivacy sharedInstance].switchDefaultState = NO;

*4.4.3 : 10/14 2019*

	~ Correction on vendorlist.json usage.
	/!\ the file should be named vendorlist.json like in Android.

*4.4.2 : 09/25 2019*

    ~ Correction on TCConfigurationFactory initialisation when not using CMP

*4.4.1 : 09/20 2019*

    ~ /!\ Update Core module alongside this module.
    ~ /!\ Function to initialize Privacy have changed
    ~ Refactoring on file configurations
    + We now have a class to manage distant configuration and privacy versions are taken from the configuration.

*4.3.10 : 08/05 2019*

    ~ User-agent encoding error in stand alone privacy.


*4.3.9 : 08/02 2019*

    ~ Only passing categories ID related IAB for Consent String generation.


*4.3.8 : 06/07 2019*

	~ Corrected merge error preventing some consent hit to be sent.


*4.3.7 : 05/15 2019*

	+ Generating consent string for IAB version 1.


*4.3.6 : 05/13 2019*

	~ Corrected error in encoding constant resulting in bad display of accents.


*4.3.5 : 04/11 2019*

	~ Privacy Policy: Don't take into account the /n into the link zone.


*4.3.4 : 03/25 2019*

    ~ Refactoring and better documentation for the ID used to save the privacy.


*4.3.3 : 03/19 2019*

	+ Callback if there is an important change in configuration update.


*4.3.2 : 01/22 2019*

    + Privacy policies can be added in the descriptions.
    + Better privacy metrics


*4.3.1 : 01/04 2019*

	~ Corrected callback not called when saving consent standalone.
	~ Corrected a bug where sending nil to saveConsent would not disable the SDK.


*4.3.0 : 12/05 2018*

	+ Privacy Center to display the privacy inside the app.
	+ Managing offline configuration and checking for updates
	+ Possibility to use Privacy as a standalone module (with core, but withtout the SDK module).
	+ Possibility to give a global consent in the Privacy Center.
	~ Updated consent saving hits to use TCPID instead of the TCID.


*4.2.2 : 10/23 2018*

	+ Added callbacks for "updatedConsent" and "outdatedConsent"


*4.2.1 : 08/01 2018*

	+ You can call the "viewConsent" method to log it.
	~ Corrected the consent update hits that sometimes would be created after the disabling of the SDK.
	+ Propagating the validated categories to the hit that where waiting for consent.


*4.2.0 : 02/01 2018*

    + Give your user's privacy settings to the SDK.

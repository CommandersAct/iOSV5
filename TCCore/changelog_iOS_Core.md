Changelog iOS
=============

<div class="warning"></div>
>  If you want to check the previous version's changelog, you can find it here :

[Previous changelist](../res/changelog_iOS_3.md)

*5.4.1 : 06/19/2024*

    ~ Added base code for new Google Consent Mode update. 

*5.4.0 : 04/22/2024*

    + Added internal functionalities for new unified TCConsent variant  (Requires TCIAB 5.1.0+ && TCConsent 5.3.0+).
    ~ Remove refused_vendors from TCUser when no Consent is available.

*5.3.4 : 03/05/2024*

	+ Added privacy manifest file.

*5.3.3 : 01/31/2024*

	+ Added Google Consent Mode utilities.

*5.3.2 : 12/08/2023*

  + Added constant to push consentVersion in the server-side payload. 
  ~ Fix events payload after waiting for user agent.

*5.3.1 : 10/19/2023*

  ~ translations fix on migrating to iab v2.2.

*5.3.0 : 09/26/2023*

  /!\ Need to be updated alongside TCServerSide 5.4.0
  ~ Modifed many imports and 

*5.2.6 : 08/29/2023*

  ~ Bug fix when user agent takes time to initialize. 

*5.2.5 : 07/24/2023*

  ~ added required functionalities for IAB TCF v2.2

*5.2.4 : 05/10/2023*

  ~ Logging set to None per default.

*5.2.3 : 05/09/2023*

  ~ gender property mapping fix on TCUser.

*5.2.2 : 03/22/2023*

  + Added consistent_anonymous_id for TCUser 
  ~ AdditionalProperties property set on public, please refer to doc before usage.
  ~ Bug on full consent not always overriding properly old consent

*5.2.1 : 12/08/2022*

  - Removed bitcode variants

*5.2.0 : 11/16/2022*

  + Added additionalProperties methodes for customizing TCNetwork & TCUser

*5.1.1 : 09/28/2022*

  + Added support for TVOS inside the XCFramework (only for Core/ServerSide for now)

*5.1.0 : 05/24/2022*

	- Removing unused NormalizedID and simplified collecting idfa/idfv/ad_tracking_enabled

*5.0.0 : 03/28 2022*

    ~ Only internal renamings to go with all other 5.0.0 modules.

*4.7.10 : 09/02 2021*

	~ Quick fix to return an empty text on translation from configuration when the field doesn't exist.

*4.7.9 : 09/01 2021*

	~ [Privacy] Fixing configuration parsing which would lead to a privacy version at 0 in some rare cases.

*4.7.8 : 07/05 2021*

	~ Fix in waiting for user-agent that would not propagate the user agent when waiting for consent.

*4.7.7 : 05/12 2021*

	+ functions to manipulate the operation queue's state from the SDK.

*4.7.6 : 04/19 2021*

	/!\ We changed the version number to prevent cache issues.
	~ Same as 4.7.6 but rebuilt with another XCode version.

*4.7.5 : 04/15 2021*

	~ Added time functions in TCCoreVariables but keeping the one in the TCSDK for now.

*4.7.4 : 02/23 2021*

	~ Modified configuration retrieval to add if-modified-since in the header.

*4.7.3 : 12/18 2020*

	~ Modified build scripts to better handle XCFramework. No more debug needed, DSYM files are now directly inside the release.

*4.7.2 : 11/02/2020*

	~ Rollback from the previous version: TC_UNIQUEID is back in TCSDK.

*4.7.1 : 10/29/2020*

	/!\ Update Core and SDK at the same time.
	+ Removed TC_UNIQUEID from TCSDK and added it in TCCore.

*4.7.0 : 10/07/2020*

	+ Building for iOS 14.
	+ (iOS 14+ only) IDFA is no longer automatically fetched, please check SDK documentation.

*4.6.9 : 02/23 2020*

	~ Modified configuration retrieval to add if-modified-since in the header.

*4.6.8 : 11/02/2020*

	~ Rollback from the previous version: TC_UNIQUEID is back in TCSDK.

*4.6.7 : 10/29/2020*

	/!\ Update Core and SDK at the same time.
	+ Removed TC_UNIQUEID from TCSDK and added it in TCCore.

*4.6.6 : 10/07/2020*

	- removing deprecated isAdvertisingTrackingEnabled around the fetching of IDFA.

*4.6.5 : 09/21/2020*

	+ Added a way to use a custom WKProcessPool when asking for user agent to prevent cookie erasure.

*4.6.4 : 08/31/2020*

	/!\ To benefit from this update you need to also update the SDK module to 4.5.4 or later.
	+ Added a way to wait for the asynchroneous user-agent to be available.

*4.6.3 : 07/30/2020*

	~ Configuration files updates are now raising a notification.

*4.6.2 : 02/19 2020*

	+ Added LICENCE.md in release zips to allow cocoapods to read it automatically

*4.6.1 : 12/19 2019*

	~ issue with User-Agent not saved in the core dictionnary anymore leading it to be missing for other modules.
	~ corrected bug in the initialisation of SDK_ID which would not be saved properly inside the core dictionnary the first app launch.

*4.6.0 : 12/18 2019*

	/!\ With this update you need to also update the SDK module to 4.5.0+
	- Removing armv7s support.
	+ TVOS compatibility.
	+ Fixed useragent on TVOS since it's not compatible with WebKit.
	- Removed battery monitoring.

*4.5.5 : 11/11 2019*

	+ Allow to change the bundle where the module reads the default configuration files on a file per file basis. Please read the Privacy module's documentation.

*4.5.4 : 10/23 2019*

	~ Correction for 4.5.3 where no offline configuration would still cause a crash in preSaveOfflineJSON.

*4.5.3 : 10/14 2019*

	+ Removed the need to have the offline counterpart of configuration files.

*4.5.2 : 10/02 2019*

    ~ Verifying that all WKWebView opererations are done on the main thread.

*4.5.1 : 09/30 2019*

    ~ Removing old UIWebView now deprecated for getting user-agent with WKWebView.


*4.4.1 : 09/20 2019*

    + Refactoring on configuration files which now are in the priority queue.


*4.3.3 : 06/04 2019*

	- Removed useless (and deprecated key) in Info.plist


*4.3.2 : 05/13 2019*

	~ Corrected error in encoding constant resulting in bad display of accents.


*4.3.1 : 03/12 2019*

    + Added route for Partners hits
    ~ Small HTTP notifications refactorisation


*4.3.0 : 12/05 2018*

	+ Moved TCUser_agent in Core


*4.2.3 : 08/06 2018*

	~ Refactoring on consent hits to give them a proper route.


*4.2.2 : 08/01 2018*

	+ We can now modify a TCHTTPOperation to put additional post data.


*4.2.1 : 06/27 2018*
	
	+ Privacy notifications.


*4.2.0 : 06/13 2018*

	+ Allow direct acces to setIDFA and setIDFV to reload those values when the first init came too soon.


*4.1.5 : 12/06 2017*

	+ You can now disable the SDK by calling disableSDK() nothing will be treated by the SDK after this.


*4.1.4 : 11/22 2017*

	+ Added Background Mode, a way to force the SDK to work when the application is in background.
	- Removed the ways to directly touch the DynamicStores used by the system classes.


*4.1.3 : 03/08 2017*

	+ Added TC_SDK_ID and TC_NORMALIZED_ID


*4.1.2 : 03/08 2017*

	~ Correction on ReachabilityChangedNotification.


*4.1.1 : 03/02 2017*

	+ Corrected issue on unrecognized selector in Core with NoIDFA.


*4.1.0 : 02/06 2017*

	+ Beacon module release.


*4.0.0 : 12/12 2016*

	+ Added Cocoapods support.
	~ Modified release format from static library to Framework.
    + Separated all the core functions into a separated and reusable module.
    + Added TCDebug class to clarify the debug options and have equal functionalities as the Android counterpart.
    - Removed the log output "file".

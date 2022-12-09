Changelog iOS
=================

*5.0.1 : 12/08/2022*

	- Removed noIDFA & all bitcode variants.
	~ All pods renamed to snake_case.


*5.0.0 : 03/28 2022*

    ~ new version up to date with other the changes

*4.6.5 : 12/18 2020*

	~ Modified build scripts to better handle XCFramework. No more debug needed, DSYM files are now directly inside the release.

*4.6.4 : 12/04/2020*

	~ Fixing missing bundle ID in TCPartners.

*4.6.3 : 11/19/2020*

	~ Fixing the initialisation of AAM to force it after getting the consent.
	~ Corrected another crash cause by the release of the JSON configuration.

*4.6.2 : 11/05/2020*

	/!\ This update require an update of SDK and Core
	~ Modified the source of uniqueID back to TCSDK.
	~ Corrected a crash cause by the release of the JSON configuration.

*4.6.1 : 10/29 2020*

	/!\ This update require an update of SDK and Core
	~ Modified the ID used to send information to Adobe from IDFA to uniqueID.

*4.6.0 : 09/24 2020*

	+ Building for iOS 14.

*4.5.8 : 12/04/2020*

	~ Fixing missing bundle ID in TCPartners.

*4.5.7 : 11/19/2020*

	~ Fixing the initialisation of AAM to force it after getting the consent.

*4.5.6 : 11/06/2020*

	~ Corrected another crash cause by the release of the JSON configuration.

*4.5.5 : 11/05/2020*

	~ Corrected a crash cause by the release of the JSON configuration.

*4.5.4 : 11/02/2020*

	/!\ This update require an update of SDK and Core
	~ Modified the source of uniqueID back to TCSDK.

*4.5.3 : 10/29 2020*

	/!\ This update require an update of SDK and Core
	~ Modified the ID used to send information to Adobe from IDFA to uniqueID.

*4.5.2 : 03/26 2020*

	~ Correting the initialisation of offline segments to force it at nil.

*4.5.1 : 02/19 2020*

	+ Added LICENCE.md in release zips to allow cocoapods to read it automatically.

*4.5.0 : 12/18 2019*

	- Removing armv7s support.

*4.4.4 : 10/21 2019*

	+ Adding a way to create offline segments for faster customisation.

*4.4.3 : 09/25 2019*

	+ Adding a "all but for key + value" activation system for partners.

*4.4.2 : 09/23 2019*

	+ Protection when segment list is empty.

*4.4.1 : 09/20 2019*

    ~ /!\ Update Core module alongside this module.
    + Allowing for offline and distance segments to be declared beforehand.
    + Adding a "all but for key" activation system for partners.

*4.3.1 : 05/09 2019*

	~ Adobe Audience Manager now check privacy by itself, and doesn't wait for the "starting SDK notification".


*4.3.0 : 03/11 2019*

	+ Adobe Audience Manager
	+ Freewheel to parse Adobe's Segments

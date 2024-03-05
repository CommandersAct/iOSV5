Changelog iOS
=============

*5.0.2 : 03/05/2024*

    + Added privacy manifest file.

*5.0.1 : 12/08/2022*

	- Removed bitcode variants


*5.0.0 : 03/28 2022*

	~ Small refactorings to be up to date with the other changes from ServerSide, Core and Consent.


*4.7.1 : 11/23 2021*

	~ fix an issue with resetSave not removing the AC-String properly.

*4.7.0 : 09/01 2021*

    /!\ Requires TCPrivacy 4.9.0+
    + We can now build Google AC-String.

*4.6.1 : 12/18 2020*

	~ Modified build scripts to better handle XCFramework. No more debug needed, DSYM files are now directly inside the release.

*4.6.0 : 09/24 2020*

	+ Building for iOS 14.

*4.5.1 : 09/07 2020*

	+ Adding the possibility to save the PublisherTC part of the consent string. Please check the documentation.

*4.5.0 : 07/30 2020*

	/!\ Requires Privacy 4.6.0+, Core 4.5.1+
	+ IAB's consentString is now in version 2.
	+ Saving information in TCData.

*4.4.3 : 03/03 2020*

	~ Changed the consent screen ID to 1
	~ Corrected bug of saving issues on IABConsent_ParsedVendorConsents and IABConsent_ParsedPurposeConsents.
	~ Corrected bug on time_created and time_updated values in the consent string.

*4.4.2 : 02/19 2020*

	+ Added LICENCE.md in release zips to allow cocoapods to read it automatically

*4.4.1 : 02/04 2020*

	~ Correcting crash on iOS 9 due to Int being encoded on less than 64 bits.

*4.4.0 : 12/18 2019*

	- Removing armv7s support.

*4.3.4 : 11/23 2019*

    ~ The consent string was not compliant to BASE64url (RFC 4648) and caused some vendors to crash.

*4.3.3 : 10/31 2019*

    ~ Corrected the key IABConsent_SubjectToGDPR which was not saved as a string.

*4.3.2 : 10/29 2019*

    ~ Protection on maxVendorID which can be empty before the vendorList is updated.

*4.3.1 : 10/24 2019*

	+ Added several new keys to the user defaults.
	+ IABConsent_SubjectToGDPR which defaults to "1"
	+ IABConsent_ParsedVendorConsents String of “0”s and “1”s, where the character at position N indicates the consent status to vendorID N as defined in the Global Vendor List. 
	+ IABConsent_ParsedPurposeConsents String of “0”s and “1”s, where the character at position N indicates the consent status to purposeID N as defined in the Global Vendor List.

*4.3.0 : 05/15 2019*

	+ Release of the first version of IAB consent string framework

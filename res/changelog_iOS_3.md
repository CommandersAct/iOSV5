Changelog iOS
=============

*3.2.2016-09-26*

    + Added a new predefined variable representing the first launch of the application.

*3.2.2016-08-22*

    + Added a new predefined variable representing the first execute after the launch of the application.

*3.2.2016-06-15*

    + Added SDK version in the sampling hits sent to TagCommander.

*3.2.2016-05-25*

    ~ Corrected bug with old offline hits crashing the application when changing SDK version.
    ~ Location updates now only starts if the application has already asked the user for the rights to do it.

*3.2.2016-05-19*

    - Removed IP and Location as mandatory parameters for hits to be sent.

*3.2.2016-04-22*

    ~ Fixed TagCommander version displayed in the log.
    ~ TCDemo has better variable names.
    ~ Some improvements on the documentation.
    ~ Offlines hits are kept a longer time.

*3.2.2016-04-07*

    ~ Completed TCProduct and added the possibility to add custom properties.

*3.2.2016-04-05*

    ~ Corrected some timestamps in TCComScore start hits.
    ~ Corrected a rare crash on the didEnterBackground notification.

*3.2.2016-02-10*

    ~ ComScore protection against initialisation hits with no conditions.

*3.2.2015-11-09*

    ~ Renamed NSData symbol dataFromBase64String to TCdataFromBase64String to prevent name collision
    ~ Renamed NSData symbol base64EncodedString to TCbase64EncodedString to prevent name collision

*3.2.2015-10-28*

    + Added synonym system to rename most predefined variables to a simpler and cleaner name while still supporting the old names.
    ~ updated the documentation of the predefined variables. (Don't hesitate to ask for this documentation if you need it!)
    + Added a default value for languageGA and CS in case there is no _ in the language.
    ~ Simplified header include (#include "TagCommander.h" should be enough)

*3.1.2015-10-07*

    + New major version with Adserving support with TCAdServing
    ~ Support for Flurry 7.1.1 (Analytics and Adserving)
    + Support for Smart Ad Server 4.2.2 (Adserving)
    + Added support for ComScore scorecardresearch
    + Support for additional parameters for all the vendors
    ~ Fixed some #define in unit tests
    + Added initialization and configuration tags
    ~ Refactoring and regrouping of all predefined variables

*2.7.BETA1*

    ! BETA VERSION: Please contact mobile@tagcommander.com if you have any issue
    ~ compiled with the ENABLE_BITCODE = YES option
    ~ CDN downloading is now using HTTPS
    ~ corrected bug on condition checking on numbers
    ~ Miscallenous unit tests fixes
    + Added platform changelog in PDF documentation

*2.6.2015-07-30*

    + Added predefined variables #TC_LAST_SESSION_LAST_HIT# and #TC_LAST_SESSION_LAST_HIT_MS#

*2.4.2015-06-30*

    + Added compatibility with AdMaster

*2.4.2015-05-07*

    ~ Fix on container reload frequency

*2.4.2015-04-21*

    ~ Bug fix #TC_NAV_TIMESTAMP_CURRENT_CALL# and #TC_NAV_TIMESTAMP_LAST_CALL#
    ~ Fix crash in Unit Tests on iOS 8 Simulator when asking for the User-Agent

*2.4.2015-04-20*

    + Support for sessions
    + New predefined internal variable : #TC_TIMESTAMP_CURRENT_VISIT# and #TC_TIMESTAMP_CURRENT_VISIT_MS#
    + New predefined internal variable : #TC_NAV_TIMESTAMP_LAST_CALL# and #TC_NAV_TIMESTAMP_LAST_CALL_MS#
    + New predefined internal variable : #TC_NUMBER_VISITS#
    + TCDemo : All predefined variables are displayed in the Settings Tab
    + #TC_IDFA# will be empty if isAdvertisingTrackingEnable is NO
    + New predefined internal variable : #TC_LIMIT_USER_TRACKING_ENABLED#
    ~ Fix stuck hit with geolocalisation on iOS 8
    ~ #RAND# is now always positive
    ~ TC_CURRENCY_SYMBOL is no longer nil
    ~ Application name is now correct on iOS 8
    ~ Fix delta background and foreground times in in TCComScore
    ~ TCDispatcher listening to BatteryAvailable so it can get back online
    ~ Better accurary on #TC_NOW#
    - Removed old code in TCDemo
    ~ IPHONEOS_DEPLOYMENT_TARGET = 7.0
    ~ Some cleaning up in the Developer Documentation

*2.3.2015-04-08*

    - Dropped support for armv7s (armv7 is still included)
    + Google Conversion 3.2.0 enabled in base release

*2.3.2015-03-20*

    ~ Bug fix Google Analytics HTTP Header User-Agent

*2.3.2014-12-05*

    + Support for ComScore
    + Added many predefined variables and added a milliseconds counterpart on all timestamps.
    - Minimum supported iOS version is 7.0
    - Dropped support for armv6

*2.2.2014-09-12*

    + Support for Criteo
    ~ Better and cleaner documentation
    ~ Bug fix : Google Analytics Products and Criteo URL encoding
    + New TCDemo method :  sendConversion
    + Better unit tests in TCParser
    ~ Bug fix : Don't apply TCFunction if invalid

*2.2.2014-08-18*

    + Support for embedded Google Conversion (v3.1.1)
    + Two-Dimension array support
    + Mapped Variables
    + Internal Variables
    + Processing functions (split, replace)
    ~ Bug fix : special cases removeQuotes
    ~ Cleaned up internal initialisation
    ~ More robust vendors notifications
    ~ Updated documentation
    ~ Better logs messages

*2.0.2014-07-31*

    ~ Bug fix: isempty undefined
    ~ Updated Documentation
    + Downloading again the XML container in bad network conditions
    + Waiting for #IP# in TCWaitingCondition
    ~ Minor log (null) for TCSampling
    + TagCommander version in the logs
    + Automated releases and Continuous Integration

*2.0.2014-07-15*

    ~ More documentation on the migration from v1 to v2

*2.0.11*

    ~ Bug fix : Moving TCTestUtils -> TCUtils : "+ (BOOL) doesString: (NSString *) string matchRegexp: (NSString *) expr;"
    + New distributed headers : TCUtils.h, TCSampling.h and TCXMLReader.h (not strictly needed, but better be safe than sorry)

*2.0.10*

    ~ Bug fix : threads synchronicity when initialising all the Singletons
    ~ All the threaded unit tests are passing
    + New class : TCSingleton (mostly empty for now)
    + New Enum : TCSingletonInitState in TCSingleton
    ~ TCState, TCNetworkManager, TCLogger, TCDispatcher inherit from TCSingleton
    + new reinit method in all the singletons (TCState, TCNetworkManager, TCLogger, TCDispatcher)
    ~ Constants Police : @"tc_date_first_visit_%i_%i" -> kTCDateFirstVisitFormat
    ~ Small test fixes in TCStateTests
    ~ TCTestCase : [[TCState sharedInstance] init] -> [[TCState sharedInstance] reinit]
    ~ Small documentation update
    ~ Better logs on condition matching
    ~ Small update on the IDFA variable (+ unit test)
    ~ Fix IDFA value, new Framework dependency : AdSupport.framework
    + Recovery of some test XML files
    ~ Better sanity check when adding a variable to a TCDynamicStore
    ~ Exception catching when converting a string to a NSNumber
    + Much more and thorough unit tests on the TCRule matching and TCParser
    ~ Fix Inverted conditions: GREATERTHAN and LESSTHAN
    ~ Light debugging on the CONTAINS, EXISTS, ISEMPTY conditions

*2.0.9*

    ~ Fix: Rare Crash in TCDispatcher singleton when loading saved hits.
    - Removed warnings in TCDemo, some cleanup in the XCConfig file
    ~ Huge refactor of TCDispatcher (no functional changes)
    + New XCode Universal Release target

*2.0.8*

    ~ Fix: Reachability at first launch returns the correct connection type
    ~ Fix: Crasher when fetching the #TC_USER_AGENT# in a thread other than the main thread
    + Some new predefined variables : #RAND# and #EMPTY#
    + [[TCState sharedInstance] randomString]
    ~ Refactoring on TCDynamicResolver
    + New unit tests on TCDynamicResolver

*2.0.7*

    ~ Fix: Improved compatibility with empty HTTP variable

*2.0.6:*

    ~ Fix: Crasher in AppleLocale Format
    ~ Fix: #IP# when the phone is only on a mobile network
    ~ Fix: Setting a nil value in a dynamic store is ignored
    + New getter : [TCState sharedInstance] manufacturer]
    ~ [TCState sharedInstance] getUserAgent] -> [TCState sharedInstance] userAgent]

*2.0.5:*

    + new #TC_MANUFACTURER# predefined dynamic variable
    ~ fix empty #IP#
    + new #TC_USER_AGENT# predefined dynamic variable
    + new #TC_IDFV# predefined dynamic variable
    + new Added tests on getting all predefined dynamic variables from TCState.
    ~ fix Use the CDN XML by default
    + new #TC_APPLICATION_VERSION#
    ~ fix defensive coding: isValidURL protects the creation of HTTPOperation

*2.0.4:*

    ~ Changing TCCustomURL into a singleton to initialise it only once.
    + Improving the log message on HTTPRequestError
    ~ TCReachability: NetworkStatus -> TCNetworkStatus
    ~ TCRecette is now using debug universal

*2.0.0:*

    + First release.



<html>
<body>
<p><img alt="alt tag" src="../res/ca_logo.png" /></p>
<h1 id="partners-implementation-guide">Partners' Implementation Guide</h1>
<p><strong>iOS</strong></p>
<p>Last update : <em>11/10/2022</em><br />
Release version : <em>5.0.0</em></p>
<p><div id="end_first_page" /></p>

<div class="toc">
<ul>
<li><a href="#partners-implementation-guide">Partners' Implementation Guide</a></li>
<li><a href="#introduction">Introduction</a></li>
<li><a href="#partners">Partners</a></li>
<li><a href="#adobe-audience-manager-aam">Adobe Audience Manager (AAM)</a><ul>
<li><a href="#hit">Hit</a></li>
</ul>
</li>
<li><a href="#freewheel">Freewheel</a></li>
<li><a href="#support-and-contacts">Support and contacts</a></li>
</ul>
</div>
<h1 id="introduction">Introduction</h1>
<p>In some specific cases we need to have a direct connection from the phone to a vendor.</p>
<p>In this case hits need to be sent from the phone and we need to treat the response from the server inside the app.</p>
<h1 id="partners">Partners</h1>
<p>TCPartners or TCMobilePartners is the class used as the super-type of all partners.</p>
<p>A TCPartner is by default a partner that will listen to all hits you're passing to the SDK so he can work on them.
You can change this activation by using on of the 3 following functions:</p>
<pre><code>/**
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
</code></pre>
<p>So think carefully about which activation method you want for your partners.</p>
<h1 id="adobe-audience-manager-aam">Adobe Audience Manager (AAM)</h1>
<p>The point of this connector is the send information to Adobe Audience Manager and get back the segments corresponding to the app user.</p>
<pre><code>[[TCPartners_AdobeAudienceManager sharedInstance] setDataSourceID: 81811 andPlatformID: 20201];
[[TCPartners_AdobeAudienceManager sharedInstance] initSegmentation];
</code></pre>
<p>If you want to use your custom configuration to use offline segments ID, please also add this line.</p>
<pre><code>[[TCPartners_AdobeAudienceManager sharedInstance] addOfflineConfigurationForSiteID: 3311 andContainerID: 1];
</code></pre>
<p>This connector only works if we have and IDFA or AAID.</p>
<h2 id="hit">Hit</h2>
<p>Since we're potentially sending information to several partners we need to differentiate the data for AAM.
We're basing ourselves on the datalayer and are taking all the keys prefixed "c_" as keys to add to the hits sent to AAM.</p>
<p>If among the data layer, the connector finds the key #USER_ID#, we will send an "identified" hit. Which simply behave slightly differently, but has the same use.</p>
<h1 id="freewheel">Freewheel</h1>
<p>Our Freewheel implementation is only made to forward the segments computed in Adobe for them.</p>
<p>This means we only need 2 things to make it work.</p>
<p>The first one is the callback function that should be called when we parsed the segment information.</p>
<p>The second is the domain which correspond to the application. This is needed because AAM can send information from several different app domains when you have several configured.</p>
<p>You will have to register to a callback to receive the content of the segments.</p>
<p>And will receive a response of the format:</p>
<pre><code>{
    aam_fr=sid=81025,
    aam_oas=PYT_63359=Y,
    aam_fw=PYT_63359=Y&amp;PYT_619=Y&amp;PYT_7398=Y&amp;PYT_94221
}
</code></pre>
<p>To initialize Freewheel:</p>
<pre><code>[[TCPartners_Freewheel sharedInstance] setDomain: @".tf1.fr"];
[[TCPartners_Freewheel sharedInstance] setCallback: self];
</code></pre>
<p>And to recover the segments:</p>
<pre><code>- (void) onSegmentReceived: (NSDictionary *) segments
{
    [[TCLogger sharedInstance] logMessage: [NSString stringWithFormat: @"onSegmentReceived: %@", segments] withLevel: TCLogLevel_Error];
}
</code></pre>
<h1 id="support-and-contacts">Support and contacts</h1>
<p><img alt="alt tag" src="../res/ca_logo.png" /></p>
<hr />
<p><strong>Support</strong>
<em>support@commandersact.com</em></p>
<p>http://www.commandersact.com</p>
<p>Commanders Act | 3/5 rue Saint Georges - 75009 PARIS - France</p>
<hr />
<p>This documentation was generated on 11/10/2022 16:15:56</p>
</body>
</html>
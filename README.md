
<html>
<body>
<p><img alt="alt tag" src="res/ca_logo.png" /></p>
<h1 id="developers-implementation-guide">Developers' Implementation Guide</h1>
<p><strong>iOS</strong></p>
<p>Last update : <em>04/08/2022</em><br />
Release version : <em>5</em></p>
<p><div id="end_first_page" /></p>

<div class="toc">
<ul>
<li><a href="#developers-implementation-guide">Developers' Implementation Guide</a></li>
<li><a href="#introduction">Introduction</a></li>
<li><a href="#latest-available-versions">Latest available versions</a></li>
<li><a href="#adding-a-module-to-your-project">Adding a module to your project</a></li>
<li><a href="#cocoapods">Cocoapods</a><ul>
<li><a href="#build-variants">Build Variants</a></li>
<li><a href="#xcframework">XCFramework</a></li>
</ul>
</li>
<li><a href="#support-and-contacts">Support and contacts</a></li>
</ul>
</div>
<h1 id="introduction">Introduction</h1>
<p>TagCommander for mobile is a collection of small SDKs each designed to serve a dedicated purpose.
The modules are the following :</p>
<p><a href="TCCore/README.md">Core : Used as a base by the other modules.</a></p>
<p><a href="TCServerSide/README.md">ServerSide : Tag management system collecting data through a server-side approach.</a></p>
<p><a href="TCSegment/README.md">Segment : Get your user segmentation from our servers.</a></p>
<p><a href="TCConsent/README.md">Consent : Pass the Consent settings to our tag system</a></p>
<p>For each of those modules, please check their respective documentation for more information.</p>
<h1 id="latest-available-versions">Latest available versions</h1>
<p>Core : <em>5.1.0</em></p>
<p>ServerSide : <em>5.1.1</em></p>
<p>Consent : <em>5.1.1</em></p>
<p>IAB : <em>5.0.0</em></p>
<p>Partners : <em>5.0.0</em></p>
<p>Segment : <em>5.0.0</em></p>
<h1 id="adding-a-module-to-your-project">Adding a module to your project</h1>
<p>If you want to add a module to your iOS project, you have several possibilities.</p>
<pre><code>- Using cocoapods to manage the dependency.
- Using directly the framework files in your project.
</code></pre>
<h1 id="cocoapods">Cocoapods</h1>
<div class="warning"></div>

<blockquote>
<p>We renamed all our pods! The names of the pod changed to be able to reflect the exact content of the podspec (and thus preventing the name warning).</p>
</blockquote>
<p>All latests now point toward an XCode 12 compiled version. If you still need XCode 11, please check the changelogs and point to the pod inside the latest XCode 11 release available. XCode 11 is not supported anymore and no new releases will be made for it.</p>
<pre><code>pod 'latest-TCCore', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/latest-TCCore.podspec'
pod 'latest-TCServerSide', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/latest-TCServerSide.podspec'
</code></pre>
<p>You can also point on a specific version (only for the latests builds):</p>
<pre><code>pod 'TCCore', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/5/0/0/TCCore.podspec'
pod 'TCServerSide', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/5/0/0/TCServerSide.podspec'
</code></pre>
<h2 id="build-variants">Build Variants</h2>
<p>We have several variants depending on your needs.</p>
<pre><code>- 1 full vanilla version
- 1 vanilla version with Bitcode enabled
- 1 version without the code to get the IDFA
- 1 version without the code to get the IDFA with Bitcode enabled
</code></pre>
<p>The 2 latests variants will not compile anything linked with ASIdentifierManager.</p>
<p>If you're using Consent (Privacy) there is a bit more variants depending on wether you're using IAB or not for your privacy.</p>
<h2 id="xcframework">XCFramework</h2>
<p>The latest version of our modules are always available on our github account: https://github.com/TagCommander/iosv5
e
<div class="warning"></div></p>
<blockquote>
<p>You will always need to at least add the Core module to your project.</p>
</blockquote>
<p>Add the modules you need to your project and confirm that XCode really added them for your Target at the following places:</p>
<pre><code>- In the "general" tab under "Linked Frameworks and Libraries"
- In the "Build Phases" tab under "Link Binary With Libraries"
- That the FRAMEWORK_SEARCH_PATHS do include the places where the frameworks are.
</code></pre>
<h1 id="support-and-contacts">Support and contacts</h1>
<p><img alt="alt tag" src="../res/ca_logo.png" /></p>
<hr />
<p><strong>Support</strong>
<em>support@commandersact.com</em></p>
<p>http://www.commandersact.com</p>
<p>Commanders Act | 3/5 rue Saint Georges - 75009 PARIS - France</p>
<hr />
<p>This documentation was generated on 04/08/2022 16:50:30</p>
</body>
</html>
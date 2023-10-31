
<html>
<body>
<p><img alt="alt tag" src="res/ca_logo.png" /></p>
<h1 id="developers-implementation-guide">Developers' Implementation Guide</h1>
<p><strong>iOS</strong></p>
<p>Last update : <em>31/10/2023</em><br />
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
<li><a href="#spm-support">SPM support</a></li>
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
<p><a href="TCConsent/README.md">Consent : Pass the Consent settings to our tag system</a></p>
<p>For each of those modules, please check their respective documentation for more information.</p>
<h1 id="latest-available-versions">Latest available versions</h1>
<p>Core : <em>5.3.1</em></p>
<p>ServerSide : <em>5.4.1</em></p>
<p>Consent : <em>5.1.9</em></p>
<p>IAB : <em>5.0.1</em></p>
<p>Partners : <em>5.0.2</em></p>
<h1 id="adding-a-module-to-your-project">Adding a module to your project</h1>
<p>If you want to add a module to your iOS project, you have several possibilities.</p>
<pre><code>- Using cocoapods to manage the dependency.
- Using directly the framework files in your project.
- Using SPM
</code></pre>
<h1 id="cocoapods">Cocoapods</h1>
<div class="warning"></div>
<blockquote>
<p>We renamed all our pods! The names of the pod changed to be able to reflect the exact content of the podspec (and thus preventing the name warning).</p>
</blockquote>
<p>All latests now point toward an XCode 12 compiled version. If you still need XCode 11, please check the changelogs and point to the pod inside the latest XCode 11 release available. XCode 11 is not supported anymore and no new releases will be made for it.</p>
<pre><code>pod 'latest_TCCore', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/latest_TCCore.podspec'
pod 'latest_TCServerSide', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/latest_TCServerSide.podspec'
</code></pre>
<p>You can also point on a specific version (only for the latests builds):</p>
<pre><code>pod 'TCCore', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCCore/5/0/0/TCCore.podspec'
pod 'TCServerSide', :podspec =&gt; 'https://raw.githubusercontent.com/TagCommander/iOSV5/master/TCServerSide/5/0/0/TCServerSide.podspec'
</code></pre>
<h2 id="build-variants">Build Variants</h2>
<div class="warning"></div>
<blockquote>
<p>Starting with XCode 14, Apple will no longer accept releases with Bitcode, so we removed the corresponding variants.</p>
</blockquote>
<p>We had several variants depending on your needs, but when Bitcode was removed, we tried our best to limit as much as possible.</p>
<p>Right now all modules only have one version beside:</p>
<pre><code>- [for TCCore] : one regular version
- [for TCServerSide] : one version without the code to get the IDFA
- [for TCConsent] : one regular version
- [for TCConsent] : one version made to work with IAB
</code></pre>
<p>The non-IDFA variant will not compile anything linked with ASIdentifierManager.</p>
<h2 id="xcframework">XCFramework</h2>
<p>The latest version of our modules are always available on our github account: https://github.com/TagCommander/iosv5</p>
<div class="warning"></div>
<blockquote>
<p>You will always need to at least add the Core module to your project.</p>
</blockquote>
<p>Add the modules you need to your project and confirm that XCode really added them for your Target at the following places:</p>
<pre><code>- In the "general" tab under "Linked Frameworks and Libraries"
- In the "Build Phases" tab under "Link Binary With Libraries"
- That the FRAMEWORK_SEARCH_PATHS do include the places where the frameworks are.
</code></pre>
<h2 id="spm-support">SPM support</h2>
<p>Swift Package Manager is an easy and a simple way to install Commanders Act's iOS libraries:</p>
<p>&nbsp;&nbsp;1.In Xcode, select “File” → “Swift Packages” → “Add Package Dependency”</p>
<p>&nbsp;&nbsp;2.Enter https://github.com/CommandersAct/iOSV5/</p>
<p>&nbsp;&nbsp;3.Choose the right products for your project</p>
<p><strong>/!\ Warning :</strong></p>
<p>If you need to switch your usage from SPM to cocoapods or local XCFramework, please make sur to clean your build folder.</p>
<p>If you want to change products variants or add new ones, you'll need to re-add the iOSV5 package dependency and also empty your build folder.</p>
<h1 id="support-and-contacts">Support and contacts</h1>
<p><img alt="alt tag" src="../res/ca_logo.png" /></p>
<hr />
<p><strong>Support</strong>
<em>support@commandersact.com</em></p>
<p>http://www.commandersact.com</p>
<p>Commanders Act | 7b rue taylor - 75010 PARIS - France</p>
<hr />
<p>This documentation was generated on 31/10/2023 14:39:28</p>
</body>
</html>
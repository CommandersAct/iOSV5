Pod::Spec.new do |s|
  s.name         = "TCConsent_IAB"
  s.version      = "5.1.11"
  s.homepage     = "https://github.com/TagCommander/iOSV5/tree/master/TCConsent"
  s.license      = { :type => 'proprietary', :text => <<-LICENSE
                        Copyright 2013 - present Commanders Act. All rights reserved.
                      LICENSE
                   }
  s.author       = { "Commanders Act" => "support@commandersact.com" }
  s.summary      = "TagCommander pod"
  s.description  = <<-DESC
           Go to https://github.com/TagCommander/iOSV5/tree/master/TCConsent for more details
                   DESC
  s.platform     = :ios, '8.0'
  s.source   = { :http => "https://github.com/TagCommander/iOSV5/raw/master/TCConsent/5/1/11/TCConsent_IAB.zip" }
  s.preserve_paths      = 'TCConsent_IAB.xcframework'
  #s.public_header_files = 'TCConsent_IAB.framework/Headers/*.h'
  s.vendored_frameworks = 'TCConsent_IAB.xcframework'
end

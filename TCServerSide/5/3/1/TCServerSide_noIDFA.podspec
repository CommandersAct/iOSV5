Pod::Spec.new do |s|
  s.name         = "TCServerSide_noIDFA"
  s.version      = "5.3.1"
  s.homepage     = "https://github.com/TagCommander/iOSV5/tree/master/TCServerSide"
  s.license      = { :type => 'proprietary', :text => <<-LICENSE
                        Copyright 2013 - present Commanders Act. All rights reserved.
                      LICENSE
                   }
  s.author       = { "Commanders Act" => "support@commandersact.com" }
  s.summary      = "TagCommander pod"
  s.description  = <<-DESC
           Go to https://github.com/TagCommander/iOSV5/tree/master/TCServerSide for more details
                   DESC
  s.platform     = :ios, '8.0'
  s.source   = { :http => "https://github.com/TagCommander/iOSV5/raw/master/TCServerSide/5/3/1/TCServerSide_noIDFA.zip" }
  s.preserve_paths      = 'TCServerSide_noIDFA.xcframework'
  #s.public_header_files = 'TCServerSide_noIDFA.framework/Headers/*.h'
  s.vendored_frameworks = 'TCServerSide_noIDFA.xcframework'
end

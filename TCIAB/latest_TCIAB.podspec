Pod::Spec.new do |s|
  s.name         = "latest_TCIAB"
  s.version      = "5.1.0"
  s.homepage     = "https://github.com/TagCommander/iOSV5/tree/master/TCIAB"
  s.license      = { :type => 'proprietary', :text => <<-LICENSE
                        Copyright 2013 - present Commanders Act. All rights reserved.
                      LICENSE
                   }
  s.author       = { "Commanders Act" => "support@commandersact.com" }
  s.summary      = "TagCommander pod"
  s.description  = <<-DESC
           Go to https://github.com/TagCommander/iOSV5/tree/master/TCIAB for more details
                   DESC
  s.platform     = :ios, '8.0'
  s.source   = { :http => "https://github.com/TagCommander/iOSV5/raw/5.4.9/TCIAB/5/1/0/TCIAB.zip" }
  s.preserve_paths      = 'TCIAB.xcframework'
  #s.public_header_files = 'TCIAB.framework/Headers/*.h'
  s.vendored_frameworks = 'TCIAB.xcframework'
end

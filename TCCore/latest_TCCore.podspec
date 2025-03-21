Pod::Spec.new do |s|
  s.name         = "latest_TCCore"
  s.version      = "5.4.1"
  s.homepage     = "https://github.com/CommandersAct/iOSV5/tree/master/TCCore"
  s.license      = { :type => 'proprietary', :text => <<-LICENSE
                        Copyright 2013 - present Commanders Act. All rights reserved.
                      LICENSE
                   }
  s.author       = { "Commanders Act" => "support@commandersact.com" }
  s.summary      = "TagCommander pod"
  s.description  = <<-DESC
           Go to https://github.com/CommandersAct/iOSV5/tree/master/TCCore for more details
                   DESC
  s.platform     = :ios, '8.0'
  s.source   = { :http => "https://github.com/CommandersAct/iOSV5/raw/5.4.13/TCCore/5/4/1/TCCore.zip" }
  s.preserve_paths      = 'TCCore.xcframework'
  #s.public_header_files = 'TCCore.framework/Headers/*.h'
  s.vendored_frameworks = 'TCCore.xcframework'
end

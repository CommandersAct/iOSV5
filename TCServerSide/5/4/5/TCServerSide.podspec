Pod::Spec.new do |s|
  s.name         = "TCServerSide"
  s.version      = "5.4.5"
  s.homepage     = "https://github.com/CommandersAct/iOSV5/tree/master/TCServerSide"
  s.license      = { :type => 'proprietary', :text => <<-LICENSE
                        Copyright 2013 - present Commanders Act. All rights reserved.
                      LICENSE
                   }
  s.author       = { "Commanders Act" => "support@commandersact.com" }
  s.summary      = "TagCommander pod"
  s.description  = <<-DESC
           Go to https://github.com/CommandersAct/iOSV5/tree/master/TCServerSide for more details
                   DESC
  s.platform     = :ios, '8.0'
  s.source   = { :http => "https://github.com/CommandersAct/iOSV5/raw/5.4.16/TCServerSide/5/4/5/TCServerSide.zip" }
  s.preserve_paths      = 'TCServerSide.xcframework'
  #s.public_header_files = 'TCServerSide.framework/Headers/*.h'
  s.vendored_frameworks = 'TCServerSide.xcframework'
end

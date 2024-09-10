Pod::Spec.new do |s|
  s.name         = "TCPartners"
  s.version      = "5.0.3"
  s.homepage     = "https://github.com/CommandersAct/iOSV5/tree/master/TCPartners"
  s.license      = { :type => 'proprietary', :text => <<-LICENSE
                        Copyright 2013 - present Commanders Act. All rights reserved.
                      LICENSE
                   }
  s.author       = { "Commanders Act" => "support@commandersact.com" }
  s.summary      = "TagCommander pod"
  s.description  = <<-DESC
           Go to https://github.com/CommandersAct/iOSV5/tree/master/TCPartners for more details
                   DESC
  s.platform     = :ios, '8.0'
  s.source   = { :http => "https://github.com/CommandersAct/iOSV5/raw/5.4.10/TCPartners/5/0/3/TCPartners.zip" }
  s.preserve_paths      = 'TCPartners.xcframework'
  #s.public_header_files = 'TCPartners.framework/Headers/*.h'
  s.vendored_frameworks = 'TCPartners.xcframework'
end

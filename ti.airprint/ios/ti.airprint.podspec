
Pod::Spec.new do |s|

    s.name         = "ti.airprint"
    s.version      = "1.4.0"
    s.summary      = "Ti SDK Module for Airprint on iOS"
  
    s.description  = <<-DESC
                     Airprint module for Ti SDK.
                     DESC
  
    s.homepage     = "https://www.gradekeeper.com"
    s.license      = { :type => "Apache 2", :file => "LICENSE" }
    s.author       = 'Dawson Toth, updated by Daniel Ethier'
  
    s.platform     = :ios
    s.ios.deployment_target = '14.0'
  
    s.source       = { :git => "https://github.com/joewright/ti-airprint.git" }
    
    s.ios.weak_frameworks = 'UIKit', 'Foundation'

    s.ios.dependency 'TitaniumKit'
  
    s.public_header_files = 'Classes/*.h'
    s.source_files = 'Classes/*.{h,m}'
  end
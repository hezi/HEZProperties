Pod::Spec.new do |s|
  s.name         = "HEZProperties"
  s.version      = "0.0.5"
  s.summary      = "Adjustable parameters for iOS apps"

  s.description  = <<-DESC
                    Adjustable parameters for iOS apps, Partialy based on and similar to FBTweaks
                   DESC

  s.homepage     = "https://github.com/hezi/HEZProperties"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.author             = { "Hezi Cohen" => "hezi.co@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/hezi/HEZProperties.git", :tag => "0.0.5"}
  s.source_files  = "HEZDynamicProperties/**/*.{h,m}"
  s.requires_arc = true
end

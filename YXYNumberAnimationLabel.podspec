Pod::Spec.new do |s|
  s.name         = "YXYNumberAnimationLabel"
  s.version      = "1.0.0"
  s.summary      = "A Number Label View."
  s.description  = <<-DESC
                    A Number Label View With Animations.
                   DESC
  s.homepage     = "https://github.com/yulingtianxia/YXYNumberAnimationLabel"
  
  s.license      = 'MIT'
  s.author       = { "Yang Xiaoyu" => "yulingtianxia@gmail.com" }
  s.social_media_url = "http://twitter.com/yulingtianxia"
  s.source       = { :git => "https://github.com/yulingtianxia/YXYNumberAnimationLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'YXYNumberAnimationLabel/*'
  #s.private_header_files = 'Classes/ios/private/*.h'
  
  #s.dependency 'FLKAutoLayout', '~> 0.1'
end
Pod::Spec.new do |s|
  s.name         = "YXYNumberAnimationLabel"
  s.version      = "1.0.3"
  s.summary      = "一个可以动起来的数字Label"
  s.description  = <<-DESC
                    通过设置数字变化的插值来展现动画效果
                   DESC
  s.homepage     = "https://github.com/yulingtianxia/YXYNumberAnimationLabel"
  
  s.license      = 'MIT'
  s.author       = { "YangXiaoyu" => "yulingtianxia@gmail.com" }
  s.social_media_url = "http://twitter.com/yulingtianxia"
  s.source       = { :git => "https://github.com/yulingtianxia/YXYNumberAnimationLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'YXYNumberAnimationLabel/*'
  s.frameworks = 'Foundation', 'UIKit'
  #s.private_header_files = 'Classes/ios/private/*.h'
  
  #s.dependency 'FLKAutoLayout', '~> 0.1'
end 
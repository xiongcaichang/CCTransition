Pod::Spec.new do |s|

  s.name         = "CCTransition"
  s.version      = "1.0.0"
  s.summary      = "Library to customize transition animation in iOS 7"

  s.description  = <<-DESC
                   CCTransition provides a convenient method to present view controllers with custom animation and interaction.
                   You can also easily create your own transition animations and apply them to your view controllers to make your app stand out.

                   DESC
  s.screenshots  = "https://raw.githubusercontent.com/xiongcaichang/CCTransition/master/Demo.gif"
  s.homepage     = "https://github.com/xiongcaichang/CCTransition"
  s.social_media_url = 'http://www.xiongcaichang.com'
  s.license      = 'MIT'

  s.author       = "xiongcaichang"

  s.platform     = :ios, "6.1"

  s.source       = { :git => "https://github.com/xiongcaichang/CCTransition.git", :tag => "1.0.0" }

  s.source_files  = "Source/**/*.{h,m}"

  s.framework  = "UIKit"

  s.requires_arc = true

end

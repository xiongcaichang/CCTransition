Pod::Spec.new do |s|
s.name         = "CCModel"
s.version      = "1.0.0"
s.summary      = "transfer dictionary into Model and easy to use sqlite based on FMDB"
s.homepage     = "https://github.com/xiongcaichang/CCModel"
s.license      = "LICENSE"
s.author       = { "CC" => "15223245@qq.com" }
s.platform     = :ios, "6.0"
s.source       = { :git => "https://github.com/xiongcaichang/CCModel.git", :tag => "1.0.0" }
s.source_files  = "CCModel", "Lib/CCModel/**/*.{h,m}"
s.framework  = "UIKit"
s.dependency 'FMDB'
end
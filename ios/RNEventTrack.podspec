
Pod::Spec.new do |s|
  s.name         = "RNEventTrack"
  s.version      = "1.0.0"
  s.summary      = "RNEventTrack"
  s.description  = <<-DESC
                  RNEventTrack
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/qzslz/react-native-EventTrack.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "Masonry"

end

  

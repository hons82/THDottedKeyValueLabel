Pod::Spec.new do |s|
  s.name         	= "THDottedKeyValueLabel"
  s.version      	= "0.0.2"
  s.summary      	= "View that simplifies adding a list of key - value pairs"
  s.homepage     	= "https://github.com/hons82/THDottedKeyValueLabel"
  s.license      	= { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       	= { "Hannes Tribus" => "hons82@gmail.com" }
  s.source       	= { :git => "https://github.com/hons82/THDottedKeyValueLabel.git", :tag => "v#{s.version}" }
  s.platform     	= :ios, '6.1'
  s.requires_arc 	= true
  s.source_files 	= 'THDottedKeyValueLabel/*.{h,m}'
  s.dependency 		'MarqueeLabel', '~> 2.0.7'
  s.dependency 		'PureLayout', '~> 2.0.1'
end
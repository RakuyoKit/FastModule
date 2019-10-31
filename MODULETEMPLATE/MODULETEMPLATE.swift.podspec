# pod lib lint --verbose --allow-warnings MODULETEMPLATE.swift.podspec
# pod trunk push --verbose --allow-warnings MODULETEMPLATE.swift.podspec

Pod::Spec.new do |s|

  s.name             = 'MODULETEMPLATE.swift'

  s.version          = '1.0.0'

  s.summary          = 'MBCore iOS 。'

  s.description      = 'MBCore iOS 。'

  s.homepage         = 'https://git.mbcore.com/iOSModuleSwift/MODULETEMPLATE'

  s.license          = 'MIT'

  s.author           = { 'Rakuyo' => 'wugaoyu@mbcore.com' }

  s.source           = { :git => 'https://git.mbcore.com/iOSModuleSwift/MODULETEMPLATE.git', :tag => s.version.to_s }

  s.requires_arc     = true
  
  s.platform         = :ios, '10.0'
  
  s.swift_version    = '5.0'
  
  s.static_framework = true

  s.module_name      = 'MODULETEMPLATE'
  
  s.source_files = 'MODULETEMPLATE/MODULETEMPLATE/Core/'

end

# pod lib lint --verbose --allow-warnings MODULETEMPLATERouter.swift.podspec
# pod trunk push --verbose --allow-warnings MODULETEMPLATERouter.swift.podspec

Pod::Spec.new do |s|

  s.name             = 'MODULETEMPLATERouter.swift'

  s.version          = '1.0.0-Router'

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

  s.module_name      = 'MODULETEMPLATERouter'
  
  s.source_files = 'MODULETEMPLATERouter/MODULETEMPLATERouter/Router/'

end

Pod::Spec.new do |s|
  s.name          = 'NRKSans'
  s.version       = '1.0'
  s.summary       = 'NRK Sans definitions for iOS and tvOS'
  s.description   = 'NRK Sans definitions for iOS and tvOS'
  s.homepage      = 'https://github.com/nrkno/nrk-sans-styles'
  s.swift_version = '5.0'
  s.license       = { :type => 'Proprietary' }
  s.author        = { 'NRK' => 'nrktvlab@nrk.no' }
  s.source        = { :git => 'git@github.com:nrkno/nrk-sans-styles.git', :branch => 'main' }
  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '13.0'

  s.source_files  = 'ios/*.swift'
end

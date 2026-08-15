Pod::Spec.new do |s|
  s.name             = 'MPlatform'
  s.version          = '0.0.1'
  s.authors          = 'Taufik Fadlurahman Fajari'
  s.summary          = 'MPlatform iOS SDK'
  s.description      = 'MPlatform native iOS SDK.'
  s.homepage         = 'https://github.com/fadlurahmanfdev/MPlatform'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.platform         = :ios, '14.0'
  s.swift_version    = '6.0'

  s.source           = {
    :git => 'https://github.com/fadlurahmanfdev/MPlatform.git',
    :tag => s.version.to_s
  }

  s.source_files     = 'Sources/MPlatform/**/*.swift'
end

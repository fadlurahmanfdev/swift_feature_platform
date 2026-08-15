Pod::Spec.new do |s|
  s.name             = 'MyPlatform'
  s.version          = '0.0.1'
  s.authors          = 'Taufik Fadlurahman Fajari'
  s.summary          = 'MyPlatform iOS SDK'
  s.description      = 'MyPlatform native iOS SDK.'
  s.homepage         = 'https://github.com/fadlurahmanfdev/MyPlatform'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.platform         = :ios, '14.0'
  s.swift_version    = '6.0'

  s.source           = {
    :git => 'https://github.com/fadlurahmanfdev/MyPlatform.git',
    :tag => s.version.to_s
  }

  s.source_files     = 'Sources/MyPlatform/**/*.swift'
end

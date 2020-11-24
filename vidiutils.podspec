Pod::Spec.new do |s|
  s.swift_version = '5.4'
  s.name         = "vidiutils"
  s.version      = "0.2.0"
  s.summary      = "A comprehensive set of iOS utils"

  s.description  = <<-DESC
  A comprehensive set of iOS utils.
                   DESC

  s.homepage     = "https://git.vidiemme.it/Vidiemme/practice/mobile/ios/vidiutils"

  s.license      = "MIT (Copyright (c) 2020 Vidiemme Consulting SRL)"
  s.source       = { :git => "https://git.vidiemme.it/Vidiemme/practice/mobile/ios/vidiutils.git", :tag => "v#{s.version}" }
  s.author       = { "Vidiemme Consulting SRL" => "info@vidiemme.com" }

  s.ios.deployment_target = "10.0"

  s.source_files = 'Sources/**/*.{swift}'
end

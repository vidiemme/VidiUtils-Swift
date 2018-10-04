Pod::Spec.new do |s|
  s.swift_version = '4.1'
  s.name         = "vidiutils"
  s.version      = "0.1.0"
  s.summary      = "A comprehensive set of iOS utils"

  s.description  = <<-DESC
  A comprehensive set of iOS utils.
                   DESC

  s.homepage     = "https://github.com/vidiemme/vidiutils"

  s.license      = "MIT (Copyright (c) 2018 Vidiemme Consulting SRL)"
  s.source       = { :git => "https://github.com/vidiemme/vidiutils.git", :tag => "v#{s.version}" }
  s.author       = { "Vidiemme Consulting SRL" => "info@vidiemme.com" }

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"

  s.source_files = 'Sources/**/*.{swift}'
end

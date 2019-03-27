#
# Be sure to run `pod lib lint BlinkingLabel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "aBlinkingLabel"
  s.version          = "0.3.3"
  s.summary          = "A subclass on UILabel that provides a blink."
  s.description      = <<-DESC
                       This CocoaPod provides the ability to use a UILabel that may be started and stopped blinking.
                       DESC
  s.homepage         = "https://github.com/borgified/BlinkingLabel"
  s.license          = 'MIT'
  s.author           = { "borgified" => "borgified@gmail.com" }
  s.source           = { :git => "https://github.com/borgified/BlinkingLabel.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/borgified'
  s.swift_version    = '3.0'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end

#
# Be sure to run `pod lib lint Hangit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Hangit"
  s.version          = "1.1.0"
  s.summary          = "Location Driven Mobile Marketing."
  s.description      = <<-DESC
                       Supports iOS 7 and up. With Hangit, app publishers and marketers can get in front of their customers at precisely the right place and time and deliver a rich notification that is sure to get their attention.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/hangit/Hangit"
  s.license          = 'MIT'
  s.author           = { "John Dutchak" => "john.dutchak@hangit.com" }
  s.source           = { :git => "https://github.com/hangit/Hangit.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Example/Hangit/*.{h,m}'
  s.resource_bundles = {
    'Hangit' => ['Example/HangitSDKResources.bundle']
  }
  s.vendored_frameworks = 'Example/HangitSDK.framework'
end

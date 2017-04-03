Pod::Spec.new do |s|
  s.name             = "i18nSwift"
  s.version          = "0.3"
  s.summary          = "i18n for Swift."
  s.homepage         = "https://github.com/sgr-ksmt/i18nSwift"
  # s.screenshots     = ""
  s.license          = 'MIT'
  s.author           = { "Suguru Kishimoto" => "melodydance.k.s@gmail.com" }
  s.source           = { :git => "https://github.com/sgr-ksmt/i18nSwift.git", :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  s.source_files     = "Sources/**/*"
end

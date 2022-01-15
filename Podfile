# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TestCarGo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestCarGo

  pod 'IQKeyboardManagerSwift'
  pod 'Alamofire', '~> 4.7'
  pod 'AlamofireObjectMapper', '~> 5.0'
  pod 'Kingfisher', '~> 5.1'
  pod 'ObjectMapper', '~> 3.3'
  pod 'Firebase/Analytics'
  pod 'Firebase/Messaging'
  
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
        config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
        config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
      end
    end
  end
end
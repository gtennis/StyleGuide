# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'StyleGuide' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'ActionKit'
  pod 'AssociatedValues'
  pod 'FontBlaster'
  pod 'IQKeyboardManagerSwift'
  pod 'SkyFloatingLabelTextField', '~> 3.0'
  pod 'GrowingTextView'
  
  #pod 'AnimatedTextInput', '~> 0.3.0' # With string, numeric, pwd, multiline
  
  # Contains error validation and other styling 
  #pod 'AnimatedTextInput',
  #:git => 'https://github.com/jobandtalent/AnimatedTextInput.git',
  #:branch => 'swift3-integration'
  
  #pod 'PasswordTextField' # Use eye icon for show/hide
  
  #pod 'TextFieldEffects' # Contains nice effects
  #pod 'HTYTextField' # Bouncy placeholder
  
  #pod 'DTTextField' # Swift version of JVFloatLabeledTextField
  #pod 'JVFloatLabeledTextField', '~> 1.1'

  # Pods for MySavings

  target 'StyleGuideTests' do
    inherit! :search_paths
    # Pods for testing    
  end

  target 'StyleGuideUITests' do
    inherit! :search_paths
    # Pods for testing    
    # Need to add again otherwise framework not found is shown
  end

end

# Fixes "Use Legacy Swift Language Version" issue when performing pod update/install
# http://stackoverflow.com/a/38466703
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

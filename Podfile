# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
    pod 'Alamofire', '~> 4.0'
    pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
end

target 'BibSenac' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  shared_pods

  target 'BibSenacTests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
  end

  target 'BibSenacUITests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
  end

end

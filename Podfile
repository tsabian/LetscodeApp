# Uncomment the next line to define a global platform for your project
inhibit_all_warnings!
ios_version = '15.6'
platform :ios, ios_version

def shared_pods
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
end

def network_pods
  # pod 'Alamofire', :inhibit_warnings => true
  pod 'Alamofire'
  pod 'atlantis-proxyman'
end

target 'Letscode' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!

    # Pods for Letscode
end

target 'Quotesapp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Quotesapp
  
end

target 'ListPart1' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ListPart1
  
end

target 'NetworkManager' do
  use_frameworks!
  
  # Pods for NetworkManager
  
end

target 'Quakes' do
  use_frameworks!
  
  # Pods for Quakes
  network_pods
  
end

target 'NoDo' do
  use_frameworks!
end

target 'LetscodeWidgetExtension' do
  use_frameworks!
end

target 'QuotesWidgetExtension' do
  use_frameworks!
end

post_install do |installer|

  system('find "./Pods/Target Support Files" -name "*-resources.sh" | xargs -I{} patch -p0 {} -i ./copy_pod_resources_once.patch')

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
            config.build_settings['DEAD_CODE_STRIPPING'] = 'YES'
            config.build_settings['IPHONE_DEPLOYMENT_TARGET'] = ios_version
        end
    end
end

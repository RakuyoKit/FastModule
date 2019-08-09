source 'Your private git address'
source 'https://cdn.cocoapods.org/'

workspace 'MODULETEMPLATE.xcworkspace'

#----------------------------------------------------------#

# You can freely configure the following content 
# in the template according to the real situation.

platform :ios, '10.0'

use_frameworks!

#use_modular_headers!
inhibit_all_warnings!

install! 'cocoapods',
         :preserve_pod_file_structure => true,
         :generate_multiple_pod_projects => true
#         :incremental_installation => true

#----------------------------------------------------------#

target 'MODULETEMPLATE' do

  project 'MODULETEMPLATE/MODULETEMPLATE.xcodeproj'
  
  # pod 'MODULETEMPLATERouter.swift', '>= 1.0.0-Router'
  
end

target 'MODULETEMPLATERouter' do

  project 'MODULETEMPLATERouter/MODULETEMPLATERouter.xcodeproj'

  pod 'URLNavigator'

end

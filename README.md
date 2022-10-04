# XCUITest-TAU  

This repo contains the code to run visual tests for iOS application 

## Pre-requisite 

In order to follow this course, you will need 
 * macOS High Sierra or Mojave 
 * Xcode 10+
 * iPhone XR Simulator (come up with Xcode) 
 * Github Account
 * Applitools Account
 
 P.S: Please use the `iPhone XR` or similar size simulator for this course to avoid keyboard overlapping issues. If you use a smaller simulator like `iPhone 6` or `iPhone 5s` you might encounter keyboard overlapping issue.

## Running visual tests using UFG library

The **ufgTest** branch of the reposotory demonstrates the visual tests using Ultra Fast Grid (UFG) library for iOS application. 

### Clone repository
Clone the main branch of the repository with the following command:
```bash
git clone git@github.com:sbmallik/XCUITest-TAU.git
```
### Install Cocoapods
```bash
gem install cocoapods
```
The cocoapods version can be added in the above command as an option.
### Install EyesXCUI pod
The visual test requires the EyesXCUI pod to be installed. Please use the following command in this regard:
```bash
pod install
```
The Podfile (present the in the repository) contains the above dependency.
### Launch project in Xcode
Open the project in Xcode by running
```bash
open TAU.xcworkspace
```
### Add environment variables
Open the TAU application scheme and add the following environment variables in the Test step: 
1. APPLITOOLS_API_KEY
1. APPLITOOLS_SERVER_URL
### Run the application
Click the Run button (right arrow) on the toolbar of Xcode to build and run the application.

### Run the visual test

#### Add UFG library
Before running the visual tests using Ultra Fast Grid (UFG) library, the following steps must be executed:
1. Stop the application that was started in the above step.
1. Go to the URL to load the Applitools library as per this link: https://applitools.com/docs/topics/overview/nmg_install_ios.html#Static. Unzip the framework file and move the file `UFG_lib.xcframework` to the `Frameworks` folder located in the root folder. This step is already done in the repository.
1. Select the main application name in the project navigator inside Xcode.
1. Select the application name in the Targets sectio.
1. Select the General tab.
1. Go to the `Frameworks, Libraries, and Embedded Content` section within the selected tab and click on `+` button.
1. Select `Add Files...` from the drop down list box within the resultant dialog box.
1. Select the file `UFG_lib.xcworkspace` and click on `open` button. 
1. Please ensure `Embed & Sign` was selected in the `Embed` column. 
#### Run the visual test
After adding the UFG library, the visual tests are ready for execution. To do this, simply navigate to the test file `TAUUITests/TAUUITests.swift` file and run the test `testTAUApplitoolEyes`. This test code in the file uses the UFG library. Once the test pass, check the results in Applitools test manager.


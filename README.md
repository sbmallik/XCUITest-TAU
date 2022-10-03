# XCTUTest-TAU  

This repo contains the code to run visual tests for iOS application 

## Pre-requisite 

In order to follow this course, you will need 
 * macOS High Sierra or Mojave 
 * Xcode 10+
 * iPhone XR Simulator (come up with Xcode) 
 * Github Account
 * Applitools Account
 
 P.S: Please use the `iPhone XR` or similar size simulator for this course to avoid keyboard overlapping issues. If you use a smaller simulator like `iPhone 6` or `iPhone 5s` you might encounter keyboard overlapping issue.

## Running legacy visual tests 

The **main** branch of the reposotory demonstrates the legacy visual tests for iOS application. 

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
Stop the application that was started in the above step. Navigate to the test file `TAUUITests/TAUUITests.swift` file and run the test `testTAUApplitoolEyes`. Once the test pass, check the results in Applitools test manager.


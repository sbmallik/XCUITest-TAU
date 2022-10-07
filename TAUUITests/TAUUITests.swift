import Foundation
import XCTest
import EyesXCUI

class TAUUITests: XCTestCase {
        
  let app = XCUIApplication()
  let runner = VisualGridRunner(options: RunnerOptions().testConcurrency(5))
  var eyes: Eyes!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app.launchEnvironment = ["UFG_LIB_FRAMEWORK": "", "NML_API_KEY": ProcessInfo.processInfo.environment["APPLITOOLS_API_KEY"] ?? "", "NML_SERVER_URL": ProcessInfo.processInfo.environment["APPLITOOLS_SERVER_URL"] ?? ""]
    app.launch()
    let config = Configuration()
    let iPhone12ProMax = IosDeviceInfo(deviceName: .deviceiPhone12ProMax)
    let iPadPro = IosDeviceInfo(deviceName: .deviceiPadPro3rdgeneration)
    config.addMobileDevices([iPhone12ProMax, iPadPro])
    eyes = Eyes(runner: runner)
    eyes.configuration = config
  }
        
  override func tearDown() {
    super.tearDown()
    app.terminate()
    eyes.closeAsync()
    let fullTestResults = runner.getAllTestResultsShouldThrowException(false).getAllResults()
    for fullTestResult in fullTestResults {
      if fullTestResult.testResults?.isPassed == true {
        print(fullTestResult)
        // XCTAssertTrue(testResult.testResults?.isPassed == true, "Visual test passed")
      } else {
        XCTFail("Mismatch detected in visual test. See details at " + (fullTestResult.testResults?.url ?? "") )
      }
    }
  }

  func testAllElementsOnMainScreen() throws {
    app/*@START_MENU_TOKEN@*/.staticTexts["welcomeMessage"]/*[[".staticTexts[\"Welcome to XCUITest Course \"]",".staticTexts[\"welcomeMessage\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app/*@START_MENU_TOKEN@*/.staticTexts["enterCity"]/*[[".staticTexts[\"Enter Your City \"]",".staticTexts[\"enterCity\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app/*@START_MENU_TOKEN@*/.buttons["enrollButton"]/*[[".buttons[\"Enroll\"]",".buttons[\"enrollButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.images["TAUlogo"].tap()
    XCTAssertTrue(app.staticTexts["Please Enter City"].exists)
  }

  func testThankYouMessage() {
    app.textFields["city"].tap()
    app.textFields["city"].typeText("London")
    app/*@START_MENU_TOKEN@*/.buttons["enrollButton"]/*[[".buttons[\"Enroll\"]",".buttons[\"enrollButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    XCTAssertTrue(app.staticTexts["Thanks for Joining!"].exists)
  }
    
  func testTAUApplitoolEyes() {
    eyes.open(withApplicationName: "TAU", testName: "Applitools XCUI demo")
    app.buttons["enrollButton"].tap()
    eyes.check(withTag: "Missing city name", andSettings: Target.window().timeout(inSeconds: 15))
  }
  
}

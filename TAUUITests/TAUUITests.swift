import Foundation
import XCTest
import EyesXCUI

class TAUUITests: XCTestCase {
        
    let app = XCUIApplication()
    let runner = ClassicRunner()
    var eyes: Eyes!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        eyes = Eyes(runner: runner)
        eyes.apiKey = ProcessInfo.processInfo.environment["APPLITOOLS_API_KEY"] ?? ""
        eyes.serverURL = ProcessInfo.processInfo.environment["APPLITOOLS_SERVER_URL"] ?? ""
    }
        
    override func tearDown() {
        super.tearDown()
        app.terminate()
        eyes.closeAsync()
        print(runner.getAllTestResultsShouldThrowException(false))
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

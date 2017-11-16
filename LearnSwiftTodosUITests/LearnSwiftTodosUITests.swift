//

import XCTest

class LearnSwiftTodosUITests: XCTestCase {

  override func setUp() {
    super.setUp()

    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testExample() {
    let app = XCUIApplication()
    // Add a todo
    app.navigationBars["Todos"].buttons["Add"].tap()
    let textField = app.otherElements.containing(.navigationBar, identifier:"LearnSwiftTodos.DetailView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
    textField.tap()
    textField.typeText("test name")

    // Click done
    let doneButton = app.navigationBars["LearnSwiftTodos.DetailView"].buttons["Done"]
    doneButton.tap()
    let newTodoCell = app.tables.staticTexts["test name"]
    XCTAssert(newTodoCell.exists)

    newTodoCell.tap()
    textField.tap()
    textField.typeText(" edited")
    doneButton.tap()
    let editedTodoCell = app.tables.staticTexts["test name edited"]
    XCTAssert(editedTodoCell.exists)
  }
}

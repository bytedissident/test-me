//
//  TestMeE2ETests.swift
//  TestMeE2ETests
//
//  Created by Derek Bronston on 2/15/22.
//

import XCTest
import ViewInspector // 1.
@testable import TestMe

extension ContentView: Inspectable { } // 2.

class TestMeE2ETests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//
    func testViewInspector() {
        let sut = ContentView()
        try? sut.inspect().find(button: "Add Folder").tap()
        XCTAssertEqual(sut.viewModel.me, "hello")
    }
}



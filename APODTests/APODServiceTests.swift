//
//  APODServiceTests.swift
//  APODTests
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import XCTest
@testable import APOD

class APODServiceTests: XCTestCase {


    let testService = APODService()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPhotoJSON() {

        let expectation = expectationWithDescription("API Request Completed")

        testService.fetchPhoto(NSDate()) { photo in
            XCTAssertNotNil(photo)

            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

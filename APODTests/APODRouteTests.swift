//
//  APODRouteTests.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import XCTest

@testable import APOD

class APODRouteTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAPODURL() {
        let testDate = NSDate(timeIntervalSince1970: 1457355218) // 3/7/2016
        let testURL = APODRoute.APOD(testDate).URL

        let expectedURL = NSURL(string: "https://api.nasa.gov/planetary/apod?date=2016-03-07&api_key=DLmU2KznRNhHOiiX82Nmb9MUjwwbNh5PxaigXJiA")!

        XCTAssertEqual(testURL, expectedURL)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}

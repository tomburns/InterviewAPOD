//
//  PhotoViewModelTests.swift
//  APOD
//
//  Created by Tom Burns on 3/8/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import XCTest
import UIKit
@testable import APOD

class PhotoViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRequestPhoto() {
        
        let photoViewModel = PhotoViewModel()
        let date = NSDate()

        let expectation = self.expectationWithDescription("success")
        photoViewModel.requestPhotoForDate(date) { (success) -> Void in
            expectation.fulfill()
            XCTAssertNotNil(photoViewModel.explanationText)
            XCTAssertNotNil(photoViewModel.dateText)
            XCTAssertNotNil(photoViewModel.titleText)
            XCTAssertNotNil(photoViewModel.image)
        }

        self.waitForExpectationsWithTimeout(5.0, handler: nil)

    }



 
    
    
}

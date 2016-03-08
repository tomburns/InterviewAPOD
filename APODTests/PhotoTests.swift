//
//  PhotoTests.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import XCTest

@testable import APOD

class PhotoTests: XCTestCase {




    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testDeserializationPerformance() {
        // This is an example of a performance test case.
        self.measureBlock {
            for _ in 1...100 {
                let _ = try? Photo(json: Constants.validJSON)
            }
        }
    }

    struct Constants {
        static let validJSONString = "{\"date\": \"2016-03-07\",\"explanation\": \"What is that changing object in a cold hydrocarbon sea of Titan? Radar images from the robotic Cassini spacecraft orbiting Saturn have been recording the surface of the cloud-engulfed moon Titan for years. When imaging the flat -- and hence radar dark -- surface of the methane and ethane lake called Ligeia Mare, an object appeared in 2013 July just was not there in 2007. Subsequent observations in 2014 August found the object remained -- but had changed. In an image released last week, the mystery object seems to have disappeared in 2015 January.  The featured false-color image shows how the 20-km long object has come, changed, and gone. Current origin speculative explanations include waves, bubbling foam and floating solids, but still no one is sure. Future observations, in particular Cassini's final close flyby of Titan in 2017 April, may either resolve the enigma or open up more speculation.   Astrophysicists: Browse 1,200+ codes in the Astrophysics Source Code Library\",\"hdurl\": \"http://apod.nasa.gov/apod/image/1603/TitanLakeThing_Cassini_2000.jpg\",\"media_type\": \"image\",\"service_version\": \"v1\",\"title\": \"Mystery Feature Now Disappears in Titan Lake\",\"url\": \"http://apod.nasa.gov/apod/image/1603/TitanLakeThing_Cassini_960.jpg\"}"

        static var validJSON: AnyObject {
            let validData = validJSONString.dataUsingEncoding(NSUTF8StringEncoding)!
            return try! NSJSONSerialization.JSONObjectWithData(validData, options: [])
        }
    }
}


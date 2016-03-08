//
//  Photo.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import Foundation

struct Photo {
    let date: NSDate
    let explanation: String
    let hdURL: NSURL
    let mediaType: String
    let serviceVersion: String
    let title: String
    let sdURL: NSURL

    init(json: AnyObject) throws {
        guard let jsonDictionary = json as? NSDictionary,
        let dateString = jsonDictionary["date"] as? String,
        let date = APODConstants.photoURLDateFormatter.dateFromString(dateString),
        let explanation = jsonDictionary["explanation"] as? String,
        let hdURLString = jsonDictionary["hdurl"] as? String,
        let hdURL = NSURL(string: hdURLString),
        let mediaType = jsonDictionary["media_type"] as? String,
        let serviceVersion = jsonDictionary["service_version"] as? String,
        let title = jsonDictionary["title"] as? String,
        let sdURLString = jsonDictionary["url"] as? String,
        let sdURL = NSURL(string: sdURLString)
        else {
            throw APODError.Parse
        }

        self.date = date
        self.explanation = explanation
        self.hdURL = hdURL
        self.mediaType = mediaType
        self.serviceVersion = serviceVersion
        self.title = title
        self.sdURL = sdURL
    }
}
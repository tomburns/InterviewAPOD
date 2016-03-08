//
//  APODRoute.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import Foundation

enum APODRoute {

    case APOD(NSDate)

    var URL: NSURL {
        guard let routeURLComponents = NSURLComponents(URL: APODConstants.baseURL, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL Components from base URL")
        }

        switch self {
        case .APOD:
            routeURLComponents.path = APODConstants.dailyPhotoURLPath
            routeURLComponents.queryItems = self.parameters.map { pair in NSURLQueryItem(name: pair.0, value: pair.1) }
        }

        guard let URL = routeURLComponents.URL else {
            fatalError("Unable to create URL from components: \n \(routeURLComponents)")
        }

        return URL
    }

    private var parameters: [String: String] {
        switch self {
        case .APOD(let date):
            var parameters = APODConstants.baseParameters
            parameters["date"] = APODConstants.photoURLDateFormatter.stringFromDate(date)
            
            return parameters
        }
        
    }
}
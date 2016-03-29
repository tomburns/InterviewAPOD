//
//  APODService.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa

class APODService {

    let URLSession = NSURLSession.sharedSession()

//    func fetchPhoto(date: NSDate = NSDate(), completion: (Photo? -> Void)? = nil) {
//
//        let route = APODRoute.APOD(date)
//
//        URLSession.dataTaskWithURL(route.URL) { (data, response, error) -> Void in
//            guard error == nil,
//                let data = data,
//                let json = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
//                let photo = try? Photo(json: json) else {
//                    completion?(nil)
//                    return
//            }
//
//            completion?(photo)
//        }.resume()
//    }

    func rx_fetchPhoto(date: NSDate = NSDate()) -> Observable<Photo> {
        let route = APODRoute.APOD(date)

        return URLSession.rx_JSON(route.URL)
            .map {
                try Photo(json: $0)
        }
    }

    func fetchPhotoImage(url:NSURL, completion: (UIImage? -> Void)) {
        URLSession.dataTaskWithURL(url) { (data, response, error) -> Void in
            guard error == nil,
                let data = data,
                let image = UIImage.init(data: data) else {
                    completion(nil)
                    return
            }
            completion(image)
        }.resume()
    }

    func rx_fetchPhotoImage(url:NSURL) -> Observable<UIImage?> {
        let request = NSURLRequest(URL: url)
        let result = URLSession.rx_data(request)
        .map { data in
            return UIImage(data:data)
        }
        return result
    }

}


enum APODError: ErrorType {
    case Parse
}

struct APODConstants {
    static let APIKey = "DLmU2KznRNhHOiiX82Nmb9MUjwwbNh5PxaigXJiA"
    static let baseURL = NSURL(string: "https://api.nasa.gov")!

    static let baseParameters: [String : String] = [ "api_key" : APIKey ]

    static let dailyPhotoURLPath = "/planetary/apod"

    static let photoURLDateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"

        return formatter
    }()
}
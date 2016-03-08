//
//  PhotoViewModel.swift
//  APOD
//
//  Created by Tom Burns on 3/8/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import Foundation
import UIKit

class PhotoViewModel {

    var apodService = APODService()
    weak var titleLabel: UILabel!
    weak var dateLabel: UILabel!
    weak var explanationLabel: UILabel!
    weak var imageView: UIImageView!

    init(titleLabel:UILabel!, explanationLabel:UILabel!, dateLabel:UILabel!, imageView:UIImageView!){
        self.titleLabel = titleLabel
        self.dateLabel = dateLabel
        self.explanationLabel = explanationLabel
        self.imageView = imageView
    }

    internal func requestPhotoForDate(date:NSDate, completion:(Bool -> Void)) {
        apodService.fetchPhoto(date) { (photo) -> Void in
            var success = false
            if let realPhoto = photo {
                success = true
                self.apodService.fetchPhotoImage(realPhoto.hdURL, completion: { (image) -> Void in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.titleLabel.text = realPhoto.title
                        self.explanationLabel.text = realPhoto.explanation
                        self.dateLabel.text = APODConstants.photoURLDateFormatter.stringFromDate(realPhoto.date)
                        self.imageView.image = image
                        completion(success)
                    })
                })
            }

        }

    }

}
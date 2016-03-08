//
//  FirstViewController.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var photoViewModel : PhotoViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoViewModel = PhotoViewModel(titleLabel: self.titleLabel, explanationLabel: self.explanationLabel, dateLabel: self.dateLabel, imageView: self.imageView)
        if let realModel = self.photoViewModel {
            let calendar = NSCalendar.currentCalendar()
            let components = NSDateComponents()
            components.day = -1
            let today = NSDate()
            let targetDate = calendar.dateByAddingComponents(components, toDate: today, options: [])
            
            realModel.requestPhotoForDate(targetDate!) { (success) -> Void in
                //
            }
        }


    }
}


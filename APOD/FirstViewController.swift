//
//  FirstViewController.swift
//  APOD
//
//  Created by Tom Burns on 3/7/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    let photoViewModel = PhotoViewModel()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()


        photoViewModel.title
        .drive(titleLabel.rx_text)
        .addDisposableTo(disposeBag)

        photoViewModel.date
            .drive(dateLabel.rx_text)
            .addDisposableTo(disposeBag)

        photoViewModel.explanation
            .drive(explanationLabel.rx_text)
            .addDisposableTo(disposeBag)

        photoViewModel.image
            .drive(imageView.rx_image)
            .addDisposableTo(disposeBag)

        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()

        components.day = -1
        let today = NSDate()
        let targetDate = calendar.dateByAddingComponents(components, toDate: today, options: [])!
        

        photoViewModel.rx_requestPhotoForDate(targetDate)

//        
//        if let realModel = self.photoViewModel {
//            let calendar = NSCalendar.currentCalendar()
//            let components = NSDateComponents()
//            components.day = -1
//            let today = NSDate()
//            let targetDate = calendar.dateByAddingComponents(components, toDate: today, options: [])
//            
//            realModel.requestPhotoForDate(targetDate!) { (success) -> Void in
//                //
//            }
//        }
//

    }
}


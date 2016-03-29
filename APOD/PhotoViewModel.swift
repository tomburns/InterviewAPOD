//
//  PhotoViewModel.swift
//  APOD
//
//  Created by Tom Burns on 3/8/16.
//  Copyright © 2016 Tom Burns. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol PhotoViewModelType {
    var title: Driver<String> { get }
    var date: Driver<String> { get }
    var explanation: Driver<String> { get }
    var image: Driver<UIImage?> { get }
}

class PhotoViewModel: PhotoViewModelType {

    var apodService = APODService()

    let title: Driver<String>
    let date: Driver<String>
    let explanation: Driver<String>
    let image: Driver<UIImage?>

    private let _title = Variable("")
    private let _date = Variable("")
    private let _explanation = Variable("")
    private let _image = Variable<UIImage?>(nil)
    private let disposeBag = DisposeBag()

    init(){
        self.title = _title.asDriver()
        self.date = _date.asDriver()
        self.explanation = _explanation.asDriver()
        self.image = _image.asDriver()
    }

    func rx_requestPhotoForDate(date:NSDate) {
        apodService.rx_fetchPhoto(date).debug("photo")
            .flatMapLatest { photo -> Observable<(Photo,UIImage?)> in

                let fetchImage = self.apodService.rx_fetchPhotoImage(photo.hdURL).debug("fetch image")

                return Observable.zip(Observable.just(photo),fetchImage) {
                    ($0, $1)
                }
            }.debug("photo with image")
            .subscribeNext { photo, image in
                self._title.value = photo.title
                self._date.value = photo.date.description
                self._explanation.value = photo.explanation
                self._image.value = image
            }
            .addDisposableTo(disposeBag)
    }
}
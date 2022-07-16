//
//  BaseCollectionViewCell.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 16.07.2022.
//

import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {

    // MARK: - Reactive

    var disposeBag = DisposeBag()

    // MARK: - Overrides

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

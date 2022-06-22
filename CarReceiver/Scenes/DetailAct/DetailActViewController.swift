//
//  DetailActViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class DetailActViewController: BaseViewController<DetailActView> {

    // MARK: - Properties

    var coordinator: DetailActCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
    }

    // MARK: - Binding

    override func setupBindingInput() { }
}

// MARK: - Extension Reactive

extension Reactive where Base: DetailActViewController { }

//
//  CreateNewActViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CreateNewActViewController: BaseViewController<CreateNewActView> {

    // MARK: - Properties

    var coordinator: CreateNewActCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CreateNewActViewController"
    }

    // MARK: - Binding

    override func setupBindingInput() { }
}

// MARK: - Extension Reactive

extension Reactive where Base: CreateNewActViewController { }



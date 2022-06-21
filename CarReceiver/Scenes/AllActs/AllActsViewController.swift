//
//  AllActsViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class AllActsViewController: BaseViewController<AllActsView> {

    // MARK: - Properties

    var coordinator: AllActsCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AllActsViewController"
    }

    // MARK: - Binding

    override func setupBindingInput() { }
}

// MARK: - Extension Reactive

extension Reactive where Base: AllActsViewController { }

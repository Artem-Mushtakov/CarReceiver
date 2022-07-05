//
//  ResetPasswordViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 22.06.2022.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class ResetPasswordViewController: BaseViewController<ResetPasswordView> {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Забыли пароль"
    }

    // MARK: - Binding

    override func setupBindingInput() { }
}

// MARK: - Extension Reactive

extension Reactive where Base: ResetPasswordViewController { }


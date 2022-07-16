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

final class ResetPasswordViewController: BaseViewController<ResetPasswordView> {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Забыли пароль"
    }

    // MARK: - Binding

    override func setupBindingInput() {

        contentView.sendTextEmailPublisher
            .subscribe(onNext: { print("Reset email: \($0)") })
            .disposed(by: disposeBag)

        contentView.tapResetPasswordPublisher
            .subscribe(onNext: { print("Selact button reset password") })
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: ResetPasswordViewController { }


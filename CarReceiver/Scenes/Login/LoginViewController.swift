//
//  LoginViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 14.06.2022.
//

import UIKit
import Rswift
import RxCocoa
import RxSwift
import Then
import SnapKit

class LoginViewController: BaseViewController<LoginView> {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
    }

    // MARK: - Binding

    override func setupBindingInput() {

        contentView.loginTextFieldPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.passwordTextFieldPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.tapResetPasswordButtonPublisher
            .bind(to: rx.resetPasswordButtonTappedBinding)
            .disposed(by: disposeBag)

        contentView.tapLoginButtonPublisher
            .bind(to: rx.loginButtonTappedBinding)
            .disposed(by: disposeBag)
    }

    @objc private func openModuleResetPassword() {
        print("Open reset password")
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: LoginViewController {

    var loginButtonTappedBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            print("Open module next.")
        }
    }

    var resetPasswordButtonTappedBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            print("Open module reset password.")
        }
    }
}


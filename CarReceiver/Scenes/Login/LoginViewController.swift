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

    // MARK: - Properties

    var coordinator: LoginCoordinatorFlow?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.navigationBar.tintColor = .white
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

        contentView.tapRegistrationButtonPublisher
            .bind(to: rx.registrationButtonTappedBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: LoginViewController {

    var loginButtonTappedBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openMainTabBarCoordinator()
        }
    }

    var resetPasswordButtonTappedBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openResetPasswordCoordinator()
        }
    }

    var registrationButtonTappedBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openRegistrationCoordinator()
        }
    }
}

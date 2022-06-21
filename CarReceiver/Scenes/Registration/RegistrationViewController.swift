//
//  RegistrationViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 19.06.2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class RegistrationViewController: BaseViewController<RegistrationView> {

    // MARK: - Properties

    var coordinator: RegistrationCoordinatorFlow?
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистация"
    }

    // MARK: - Reactive

    override func setupBindingInput() {

        contentView.loginTextFieldPublisher
            .subscribe { text in print("Login \(text)") }
            .disposed(by: disposeBag)

        contentView.organizationNameTextFieldPublisher
            .subscribe { text in print("Organization Name \(text)") }
            .disposed(by: disposeBag)

        contentView.passwordTextFieldPublisher
            .subscribe { text in print("Password \(text)") }
            .disposed(by: disposeBag)

        contentView.repeatThePasswordTextFieldPublisher
            .subscribe { text in print("Repeat password \(text)") }
            .disposed(by: disposeBag)

        contentView.tapRegistrationButtonPublisher
            .subscribe { tap in print("Tap registration \(tap)") }
            .disposed(by: disposeBag)
    }
}

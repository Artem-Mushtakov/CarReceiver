//
//  StartViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 19.06.2022.
//

import UIKit
import RxSwift

class StartViewController: BaseViewController<StartView> {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Добро пожаловать!"
    }

    // MARK: - Reactive

    override func setupBindingInput() {
        
        contentView.openLoginViewControllerPublisher
            .bind(to: rx.openLoginViewController)
            .disposed(by: disposeBag)

        contentView.openRegistrationViewControllerPublisher
            .bind(to: rx.openRegistrationViewController)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: StartViewController {

    var openRegistrationViewController: Binder<Void> {
        return Binder(base) { viewController, _ in
            let registrationViewController = RegistrationViewController()
            viewController.navigationController?.pushViewController(registrationViewController, animated: true)
        }
    }

    var openLoginViewController: Binder<Void> {
        return Binder(base) { viewController, _ in
            let loginViewController = LoginViewController()
            viewController.navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
}

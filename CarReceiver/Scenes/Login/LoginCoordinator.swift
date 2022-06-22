//
//  LoginCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol LoginCoordinatorFlow: AnyObject {
    func openMainTabBarCoordinator()
    func openResetPasswordCoordinator()
    func openRegistrationCoordinator()
}

class LoginCoordinator: BaseCoordinator, LoginCoordinatorFlow {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }

    // MARK: - Flow Methods

    func openMainTabBarCoordinator() {
        let mainTabBarCoordinator = MainTabBarCoordinator(navigationController: navigationController)
        coordinate(to: mainTabBarCoordinator)
    }

    func openResetPasswordCoordinator() {
        let openResetPasswordCoordinator = ResetPasswordCoordinator(navigationController: navigationController)
        coordinate(to: openResetPasswordCoordinator)
    }

    func openRegistrationCoordinator() {
        let registrationCoordinator = RegistrationCoordinator(navigationController: navigationController)
        coordinate(to: registrationCoordinator)
    }
}

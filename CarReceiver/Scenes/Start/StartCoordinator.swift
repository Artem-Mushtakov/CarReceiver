//
//  StartCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol StartCoordinatorFlow: AnyObject {
    func openRegistrationCoordinator()
    func openLoginCoordinator()
}

class StartCoordinator: BaseCoordinator, StartCoordinatorFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let startViewController = StartViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: true)
    }

    // MARK: - Flow Methods

    func openRegistrationCoordinator() {
        let registrationCoordinator = RegistrationCoordinator(navigationController: navigationController)
        coordinate(to: registrationCoordinator)
    }

    func openLoginCoordinator() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        coordinate(to: loginCoordinator)
    }
}

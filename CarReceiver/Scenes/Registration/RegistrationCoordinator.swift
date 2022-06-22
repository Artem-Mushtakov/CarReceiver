//
//  RegistrationCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol RegistrationCoordinatorFlow: AnyObject { }

class RegistrationCoordinator: BaseCoordinator, RegistrationCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.coordinator = self
        navigationController?.pushViewController(registrationViewController, animated: true)
    }

    // MARK: - Flow Methods
}

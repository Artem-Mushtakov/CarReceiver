//
//  ResetPasswordCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 22.06.2022.
//

import UIKit

protocol ResetPasswordCoordinatorFlow: AnyObject { }

class ResetPasswordCoordinator: BaseCoordinator, ResetPasswordCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let resetPasswordViewController = ResetPasswordViewController()
        resetPasswordViewController.coordinator = self
        navigationController?.pushViewController(resetPasswordViewController, animated: true)
    }

    // MARK: - Flow Methods
}


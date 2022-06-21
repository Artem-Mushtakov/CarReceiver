//
//  SettingsCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol SettingsCoordinatorFlow: AnyObject { }

class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let settingsViewController = SettingsViewController()
        settingsViewController.coordinator = self
        navigationController?.pushViewController(settingsViewController, animated: true)
    }

    // MARK: - Flow Methods
}

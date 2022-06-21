//
//  CreateNewActCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol CreateNewActCoordinatorFlow: AnyObject { }

class CreateNewActCoordinator: BaseCoordinator, CreateNewActCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let createNewActViewController = CreateNewActViewController()
        createNewActViewController.coordinator = self
        navigationController?.pushViewController(createNewActViewController, animated: true)
    }

    // MARK: - Flow Methods
}

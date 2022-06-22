//
//  AllActsCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol AllActsCoordinatorFlow: AnyObject {
    func openCreateNewAct()
}

class AllActsCoordinator: BaseCoordinator, AllActsCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let allActsViewController = AllActsViewController()
        allActsViewController.coordinator = self
        navigationController?.pushViewController(allActsViewController, animated: true)
    }

    // MARK: - Flow Methods

    func openCreateNewAct() {
        let createNewActViewCoordinator = CreateNewActCoordinator(navigationController: navigationController)
        coordinate(to: createNewActViewCoordinator)
    }
}

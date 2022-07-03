//
//  AllActsCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol AllActsCoordinatorFlow: AnyObject {
    func openCustomerData()
}

class AllActsCoordinator: BaseCoordinator, AllActsCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let allActsViewController = AllActsViewController()
        allActsViewController.coordinator = self
        /// animated false for custom transitions animates
        navigationController?.pushViewController(allActsViewController, animated: false)
    }

    // MARK: - Flow Methods

    func openCustomerData() {
        let customerDataViewCoordinator = CustomerDataCoordinator(navigationController: navigationController)
        coordinate(to: customerDataViewCoordinator)
    }
}

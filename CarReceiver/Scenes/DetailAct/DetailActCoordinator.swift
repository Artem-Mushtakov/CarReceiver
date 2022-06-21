//
//  DetailActCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol DetailActCoordinatorFlow: AnyObject { }

class DetailActCoordinator: BaseCoordinator, DetailActCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let detailActViewController = DetailActViewController()
        detailActViewController.coordinator = self
        navigationController?.pushViewController(detailActViewController, animated: true)
    }

    // MARK: - Flow Methods
}

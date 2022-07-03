//
//  FinishNewActCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

protocol FinishNewActCoordinatorFlow: AnyObject {

}

class FinishNewActCoordinator: BaseCoordinator, FinishNewActCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let finishNewActViewController = FinishNewActViewController()
        finishNewActViewController.coordinator = self
        navigationController?.pushViewController(finishNewActViewController, animated: true)
    }

    // MARK: - Flow Methods
}

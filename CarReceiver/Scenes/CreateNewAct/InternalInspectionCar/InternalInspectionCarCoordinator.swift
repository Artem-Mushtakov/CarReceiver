//
//  InternalInspectionCarCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

protocol InternalInspectionCarCoordinatorFlow: AnyObject {
    func openFinishNewAct()
}

class InternalInspectionCarCoordinator: BaseCoordinator, InternalInspectionCarCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let internalInspectionCarViewController = InternalInspectionCarViewController()
        internalInspectionCarViewController.coordinator = self
        navigationController?.pushViewController(internalInspectionCarViewController, animated: true)
    }

    // MARK: - Flow Methods

    func openFinishNewAct() {
        let finishNewActCoordinator = FinishNewActCoordinator(navigationController: navigationController)
        finishNewActCoordinator.coordinate(to: finishNewActCoordinator)
    }
}

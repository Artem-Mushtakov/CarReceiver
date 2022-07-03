//
//  CarInformationCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

protocol CarInformationCoordinatorFlow: AnyObject {
    func openVisualInspectionCar()
}

class CarInformationCoordinator: BaseCoordinator, CarInformationCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let carInformationViewController = CarInformationViewController()
        carInformationViewController.coordinator = self
        navigationController?.pushViewController(carInformationViewController, animated: true)
    }

    // MARK: - Flow Methods

    func openVisualInspectionCar() {
        let visualInspectionCarCoordinator = VisualInspectionCarCoordinator(navigationController: navigationController)
        visualInspectionCarCoordinator.coordinate(to: visualInspectionCarCoordinator)
    }
}

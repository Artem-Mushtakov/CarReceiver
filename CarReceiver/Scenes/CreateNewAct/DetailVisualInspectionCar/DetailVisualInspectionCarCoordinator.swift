//
//  DetailVisualInspectionCarCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

protocol DetailVisualInspectionCarCoordinatorFlow: AnyObject {
    func openInternalInspectionCar()
}

class DetailVisualInspectionCarCoordinator: BaseCoordinator, DetailVisualInspectionCarCoordinatorFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailVisualInspectionCarViewController = DetailVisualInspectionCarViewController()
        detailVisualInspectionCarViewController.coordinator = self
        navigationController?.pushViewController(detailVisualInspectionCarViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func openInternalInspectionCar() {
        let internalInspectionCarCoordinator = InternalInspectionCarCoordinator(navigationController: navigationController)
        internalInspectionCarCoordinator.coordinate(to: internalInspectionCarCoordinator)
    }
}

//
//  VisualInspectionCarCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

protocol VisualInspectionCarCoordinatorFlow: AnyObject {
    func openDetailVisualInspection()
}

class VisualInspectionCarCoordinator: BaseCoordinator, VisualInspectionCarCoordinatorFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let visualInspectionCarController = VisualInspectionCarViewController()
        visualInspectionCarController.coordinator = self
        navigationController?.pushViewController(visualInspectionCarController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func openDetailVisualInspection() {
        let detailVisualInspectionCarCoordinator = DetailVisualInspectionCarCoordinator(navigationController: navigationController)
        detailVisualInspectionCarCoordinator.coordinate(to: detailVisualInspectionCarCoordinator)
    }
}

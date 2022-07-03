//
//  CustomerDataCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol CustomerDataCoordinatorFlow: AnyObject {
    func openCarInformation()
}

class CustomerDataCoordinator: BaseCoordinator, CustomerDataCoordinatorFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let customerDataViewController = CustomerDataViewController()
        customerDataViewController.coordinator = self
        navigationController?.pushViewController(customerDataViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func openCarInformation() {
        let carInformationCoordinator = CarInformationCoordinator(navigationController: navigationController)
        carInformationCoordinator.coordinate(to: carInformationCoordinator)
    }
}

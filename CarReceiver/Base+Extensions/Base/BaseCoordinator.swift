//
//  BaseCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol BaseCoordinator {
    func start()
    func coordinate(to coordinator: BaseCoordinator)
}

extension BaseCoordinator {
    func coordinate(to coordinator: BaseCoordinator) {
        coordinator.start()
    }
}

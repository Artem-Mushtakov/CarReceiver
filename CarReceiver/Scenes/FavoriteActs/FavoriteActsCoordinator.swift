//
//  FavoriteActsCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

protocol FavoriteActsCoordinatorFlow: AnyObject { }

class FavoriteActsCoordinator: BaseCoordinator, FavoriteActsCoordinatorFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let favoriteActsViewController = FavoriteActsViewController()
        favoriteActsViewController.coordinator = self
        navigationController?.pushViewController(favoriteActsViewController, animated: true)
    }

    // MARK: - Flow Methods
}

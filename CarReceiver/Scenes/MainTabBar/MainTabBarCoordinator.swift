//
//  MainTabBarCoordinator.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

class MainTabBarCoordinator: BaseCoordinator {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {

        let mainTabBarController = MainTabBarController()
        mainTabBarController.coordinator = self

        /// All screen
        let allActsNavigationController = createNavigationController(title: "Все", itemImageName: "car.2", tag: 0)
        let allActsCoordinator = AllActsCoordinator(navigationController: allActsNavigationController)

        /// Favorite screen
        let favoriteActsNavigationController = createNavigationController(title: "Избранные", itemImageName: "car", tag: 1)
        let favoriteActsCoordinator = FavoriteActsCoordinator(navigationController: favoriteActsNavigationController)

        /// Settings screen
        let settingsNavigationController = createNavigationController(title: "Настройки", itemImageName: "gearshape.fill", tag: 2)
        let settingsCoordinator = SettingsCoordinator(navigationController: settingsNavigationController)

        mainTabBarController.viewControllers = [allActsNavigationController, favoriteActsNavigationController, settingsNavigationController]
        
        mainTabBarController.modalPresentationStyle = .fullScreen
        mainTabBarController.transitioningDelegate = mainTabBarController.customTransitionsDelegate
        navigationController?.present(mainTabBarController, animated: true, completion: nil)

        coordinate(to: allActsCoordinator)
        coordinate(to: favoriteActsCoordinator)
        coordinate(to: settingsCoordinator)
    }

    // MARK: - Setup function MainTabBarCoordinator

    private func createNavigationController(title: String, itemImageName: String, tag: Int) -> UINavigationController {
        guard let image = UIImage(systemName: itemImageName) else { return UINavigationController() }
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return navigationController
    }
}

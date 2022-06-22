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

    // FIXME: - Придумать как отптимизировать эту функцию (может сделать функцию для создания каждого контроллера и координатора табБара)
    func start() {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.coordinator = self

        let allActsNavigationController = UINavigationController()
        allActsNavigationController.tabBarItem = UITabBarItem(title: "Все",
                                                              image: UIImage(systemName: "car.2"),
                                                              tag: 0)

        let allActsCoordinator = AllActsCoordinator(navigationController: allActsNavigationController)

        let favoriteActsNavigationController = UINavigationController()
        favoriteActsNavigationController.tabBarItem = UITabBarItem(title: "Избранные",
                                                                   image: UIImage(systemName: "car"),
                                                                   tag: 1)

        let favoriteActsCoordinator = FavoriteActsCoordinator(navigationController: favoriteActsNavigationController)

        let settingsNavigationController = UINavigationController()
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Настройки",
                                                               image: UIImage(systemName: "gearshape.fill"),
                                                               tag: 2)

        let settingsCoordinator = SettingsCoordinator(navigationController: settingsNavigationController)

        mainTabBarController.viewControllers = [allActsNavigationController,
                                                favoriteActsNavigationController,
                                                settingsNavigationController]
        
        mainTabBarController.modalPresentationStyle = .fullScreen
        mainTabBarController.modalTransitionStyle = .flipHorizontal
        navigationController?.present(mainTabBarController, animated: true, completion: nil)

        coordinate(to: allActsCoordinator)
        coordinate(to: favoriteActsCoordinator)
        coordinate(to: settingsCoordinator)
    }

    // MARK: - Setup function MainTabBarCoordinator
}

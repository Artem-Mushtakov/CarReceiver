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
        allActsNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let allActsCoordinator = AllActsCoordinator(navigationController: allActsNavigationController)

        let favoriteActsNavigationController = UINavigationController()
        favoriteActsNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1)
        let favoriteActsCoordinator = FavoriteActsCoordinator(navigationController: favoriteActsNavigationController)

        let detailActNavigationController = UINavigationController()
        detailActNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .history, tag: 2)
        let detailActCoordinator = DetailActCoordinator(navigationController: detailActNavigationController)

        mainTabBarController.viewControllers = [allActsNavigationController,
                                                favoriteActsNavigationController,
                                                detailActNavigationController]
        
        mainTabBarController.modalPresentationStyle = .fullScreen
        mainTabBarController.modalTransitionStyle = .flipHorizontal
        navigationController?.present(mainTabBarController, animated: true, completion: nil)

        coordinate(to: allActsCoordinator)
        coordinate(to: favoriteActsCoordinator)
        coordinate(to: detailActCoordinator)
    }

    // MARK: - Setup function MainTabBarCoordinator
}

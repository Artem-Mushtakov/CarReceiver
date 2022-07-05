//
//  MainTabBarController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Properties

    var customTransitionsDelegate = CustomTransitionsDelegate()

    // MARK: - Initial

    init() {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupUiTabBarController()
        setupViewControllers()
    }

    // MARK: - Setup TabBarController

    private func setupViewControllers() {
        /// All screen
        let allActViewController = AppContainer.shared.allActsViewController
        let allActsNavigationController = createTabBarItem(viewController: allActViewController,
                                                           title: "Все", itemImageName: "car.2", tag: 0)
        /// Favorite screen
        let favoriteViewController = AppContainer.shared.favoriteActsViewController
        let favoriteActsNavigationController = createTabBarItem(viewController: favoriteViewController,
                                                                title: "Избранные", itemImageName: "car", tag: 1)
        /// Settings screen
        let settingsViewController = AppContainer.shared.settingsViewController
        let settingsNavigationController = createTabBarItem(viewController: settingsViewController,
                                                            title: "Настройки", itemImageName: "gearshape.fill", tag: 2)

        self.viewControllers = [allActsNavigationController, favoriteActsNavigationController, settingsNavigationController]
    }

    private func setupUiTabBarController() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.orange

        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false

        /// Setup transition style
        self.modalPresentationStyle = .fullScreen
        self.transitioningDelegate = self.customTransitionsDelegate
    }

    private func createTabBarItem(viewController: UIViewController, title: String, itemImageName: String, tag: Int) -> UINavigationController {
        guard let image = UIImage(systemName: itemImageName) else { return UINavigationController() }
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return navigationController
    }
}

//
//  SceneDelegate.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 14.06.2022.
//

import UIKit
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        /// Start login view controller
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: AppContainer.shared.loginViewController)
        window?.makeKeyAndVisible()
    }
}

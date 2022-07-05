//
//  AppContainer.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Swinject
import SwinjectAutoregistration

// MARK: - Контейнер для сборки приложения

final class AppContainer {

    // MARK: - Properties Container

    static let shared = AppContainer()
    private let container = Container()

    // MARK: - Get properties view controllers

    var loginViewController: LoginViewController {
        return container ~> LoginViewController.self
    }

    var mainTabBarController: MainTabBarController {
        return container ~> MainTabBarController.self
    }

    var allActsViewController: AllActsViewController {
        return container ~> AllActsViewController.self
    }

    var detailActViewController: DetailActViewController {
        return container ~> DetailActViewController.self
    }

    var favoriteActsViewController: FavoriteActsViewController {
        return container ~> FavoriteActsViewController.self
    }

    var settingsViewController: SettingsViewController {
        return container ~> SettingsViewController.self
    }

    var resetPasswordViewController: ResetPasswordViewController {
        return container ~> ResetPasswordViewController.self
    }

    var registrationViewController: RegistrationViewController {
        return container ~> RegistrationViewController.self
    }

    var customerDataViewController: CustomerDataViewController {
        return container ~> CustomerDataViewController.self
    }

    var carInformationViewController: CarInformationViewController {
        return container ~> CarInformationViewController.self
    }

    var visualInspectionCarViewController: VisualInspectionCarViewController {
        return container ~> VisualInspectionCarViewController.self
    }

    var detailVisualInspectionCarViewController: DetailVisualInspectionCarViewController {
        return container ~> DetailVisualInspectionCarViewController.self
    }

    var internalInspectionCarViewController: InternalInspectionCarViewController {
        return container ~> InternalInspectionCarViewController.self
    }

    var finishNewActViewController: FinishNewActViewController {
        return container ~> FinishNewActViewController.self
    }

    // MARK: - Initial Container

    private init() {

        // MARK: - Registrations View Controllers

        container.autoregister(LoginViewController.self,
                               initializer: LoginViewController.init).inObjectScope(.transient)

        container.autoregister(MainTabBarController.self,
                               initializer: MainTabBarController.init).inObjectScope(.transient)

        container.autoregister(AllActsViewController.self,
                               initializer: AllActsViewController.init).inObjectScope(.transient)

        container.autoregister(DetailActViewController.self,
                               initializer: DetailActViewController.init).inObjectScope(.transient)

        container.autoregister(FavoriteActsViewController.self,
                               initializer: FavoriteActsViewController.init).inObjectScope(.transient)

        container.autoregister(SettingsViewController.self,
                               initializer: SettingsViewController.init).inObjectScope(.transient)

        container.autoregister(ResetPasswordViewController.self,
                               initializer: ResetPasswordViewController.init).inObjectScope(.transient)

        container.autoregister(RegistrationViewController.self,
                               initializer: RegistrationViewController.init).inObjectScope(.transient)

        container.autoregister(CustomerDataViewController.self,
                               initializer: CustomerDataViewController.init).inObjectScope(.transient)

        container.autoregister(CarInformationViewController.self,
                               initializer: CarInformationViewController.init).inObjectScope(.transient)

        container.autoregister(VisualInspectionCarViewController.self,
                               initializer: VisualInspectionCarViewController.init).inObjectScope(.transient)

        container.autoregister(DetailVisualInspectionCarViewController.self,
                               initializer: DetailVisualInspectionCarViewController.init).inObjectScope(.transient)
        
        container.autoregister(InternalInspectionCarViewController.self,
                               initializer: InternalInspectionCarViewController.init).inObjectScope(.transient)

        container.autoregister(FinishNewActViewController.self,
                               initializer: FinishNewActViewController.init).inObjectScope(.transient)
    }
}

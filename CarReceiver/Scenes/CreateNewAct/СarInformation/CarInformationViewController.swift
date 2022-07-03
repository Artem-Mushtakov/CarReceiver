//
//  CarInformationViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CarInformationViewController: BaseViewController<CarInformationView> {

    // MARK: - Properties

    var coordinator: CarInformationCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Данные об авто"
        navigationController?.addCustomBackButton(title: "Данные о клиенте")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Binding

    override func setupBindingInput() {

        contentView.brandCarPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.modelCarPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.yearCarPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.numberCarPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.vinPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.tapNextStepButtonPublisher
            .bind(to: rx.openVisualInspectionCarBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: CarInformationViewController {

    var openVisualInspectionCarBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openVisualInspectionCar()
        }
    }
}

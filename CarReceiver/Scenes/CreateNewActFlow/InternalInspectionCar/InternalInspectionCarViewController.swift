//
//  InternalInspectionCarViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class InternalInspectionCarViewController: BaseViewController<InternalInspectionCarView> {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Внутренний осмотр"
        navigationController?.addCustomBackButton(title: "Перед автомобиля")
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

        contentView.odometrInfoTextFieldPublisher
            .subscribe { print($0) }
            .disposed(by: disposeBag)

        contentView.additionalEquipmentTextViewPublisher
            .subscribe { print($0) }
            .disposed(by: disposeBag)

        contentView.tapNextStepButtonPublisher
            .bind(to: rx.openFinishNewActBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: InternalInspectionCarViewController {

    var openFinishNewActBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            let finishNewActViewController = AppContainer.shared.finishNewActViewController
            viewController.navigationController?.pushViewController(finishNewActViewController, animated: true)
        }
    }
}

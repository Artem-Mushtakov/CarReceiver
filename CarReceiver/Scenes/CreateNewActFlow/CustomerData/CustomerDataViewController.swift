//
//  CustomerDataController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CustomerDataViewController: BaseViewController<CustomerDataView> {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Данные о клиенте"
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

        contentView.clientFullNamePublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.phoneNumberPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.orderAnOutfitPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.reasonsAappealPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.tapNextStepButtonPublisher
            .bind(to: rx.openCarInformationBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: CustomerDataViewController {
    
    var openCarInformationBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            let carInformationViewController = AppContainer.shared.carInformationViewController
            viewController.navigationController?.pushViewController(carInformationViewController, animated: true)
        }
    }
}

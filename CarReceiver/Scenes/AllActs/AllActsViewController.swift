//
//  AllActsViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class AllActsViewController: BaseViewController<AllActsView> {

    // MARK: - Properties

    var coordinator: AllActsCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }

    private func setupNavigationBar() {

        title = "Все акты"
        navigationController?.navigationBar.tintColor = .white

        /// create right button navBar (create New Act)
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem?.tintColor = .red
        navigationItem.rightBarButtonItem?.rx.tap
            .bind(to: rx.openCreateNewActModuleBinding)
            .disposed(by: disposeBag)
    }

    // MARK: - Binding
    
    override func setupBindingInput() { }
}

// MARK: - Extension Reactive

extension Reactive where Base: AllActsViewController {

    var openCreateNewActModuleBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openCreateNewAct()
        }
    }
}

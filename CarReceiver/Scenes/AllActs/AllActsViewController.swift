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

final class AllActsViewController: BaseViewController<AllActsView> {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }

    // MARK: - Private func

    private func setupNavigationBar() {

        title = "Все акты"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.barButtonItem) 
    }

    // MARK: - Binding
    
    override func setupBindingInput() {

        contentView.tapBarButtonItemPublisher
            .bind(to: rx.openCreateNewActModuleBinding)
            .disposed(by: disposeBag)

        Observable.just(TestData.testData)
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: contentView.allActDataPublisher)
            .disposed(by: disposeBag)

        contentView.tapItemCollectionView
            .bind(to: rx.openDetailModuleBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: AllActsViewController {

    var openCreateNewActModuleBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            let customerDataViewController = AppContainer.shared.customerDataViewController
            viewController.navigationController?.pushViewController(customerDataViewController, animated: true)
        }
    }

    var openDetailModuleBinding: Binder<IndexPath> {
        return Binder(base) { viewController, indexPath in
            let detailAct = AppContainer.shared.detailActViewController
            viewController.navigationController?.pushViewController(detailAct, animated: true)
            print("Selected item indexPath \(indexPath.row)")
        }
    }
}

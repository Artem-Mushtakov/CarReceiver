//
//  FavoriteActsViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class FavoriteActsViewController: BaseViewController<FavoriteActsView> {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранные"
        navigationController?.navigationBar.tintColor = .white
    }

    // MARK: - Binding

    override func setupBindingInput() {

        Observable.just(TestDataFavorite.testDataFavorite)
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: contentView.favoriteDataPublisher)
            .disposed(by: disposeBag)

        contentView.tapItemCollectionView
            .bind(to: rx.openDetailModuleBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: FavoriteActsViewController {
    
    var openDetailModuleBinding: Binder<IndexPath> {
        return Binder(base) { viewController, indexPath in
            let detailAct = AppContainer.shared.detailActViewController
            viewController.navigationController?.pushViewController(detailAct, animated: true)
            print("Selected item indexPath \(indexPath.row)")
        }
    }
}

//
//  FinishNewActViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

class FinishNewActViewController: BaseViewController<FinishNewActView> {

    // MARK: - Properties

    var coordinator: FinishNewActCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "АКТ сформирован"
        navigationController?.addCustomBackButton(title: "Внутренний осмотр")
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

        contentView.sharedDoneActPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: FinishNewActViewController {

}


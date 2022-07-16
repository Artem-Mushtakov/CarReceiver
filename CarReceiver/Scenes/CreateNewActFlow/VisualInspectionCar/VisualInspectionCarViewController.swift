//
//  VisualInspectionCarViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class VisualInspectionCarViewController: BaseViewController<VisualInspectionCarView> {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Визуальный осмотр"
        navigationController?.addCustomBackButton(title: "Данные об авто")
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
        
        contentView.tapNextStepButtonPublisher
            .bind(to: rx.openDetailVisualInspectionCarBinding)
            .disposed(by: disposeBag)

        contentView.clearCarYesButtonPublisher
            .subscribe({_ in print("Tap clearCarYesButtonPublisher") })
            .disposed(by: disposeBag)

        contentView.clearCarNoButtonPublisher
            .subscribe({_ in print("Tap clearCarNoButtonPublisher") })
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: VisualInspectionCarViewController {
    
    var openDetailVisualInspectionCarBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            let detailVisualInspectionCarViewController = AppContainer.shared.detailVisualInspectionCarViewController
            viewController.navigationController?.pushViewController(detailVisualInspectionCarViewController, animated: true)
        }
    }
}

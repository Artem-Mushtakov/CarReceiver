//
//  VisualInspectionCarViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

class VisualInspectionCarViewController: BaseViewController<VisualInspectionCarView> {
    
    // MARK: - Properties
    
    var coordinator: VisualInspectionCarCoordinatorFlow?
    
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
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: VisualInspectionCarViewController {
    
    var openDetailVisualInspectionCarBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openDetailVisualInspection()
        }
    }
}

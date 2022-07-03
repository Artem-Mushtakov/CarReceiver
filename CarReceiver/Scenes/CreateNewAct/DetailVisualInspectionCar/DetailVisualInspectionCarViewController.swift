//
//  DetailVisualInspectionCarViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

class DetailVisualInspectionCarViewController: BaseViewController<DetailVisualInspectionCarView> {
    
    // MARK: - Properties
    
    var coordinator: DetailVisualInspectionCarCoordinatorFlow?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Перед автомобиля"
        navigationController?.addCustomBackButton(title: "Визуальный осмотр")
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
            .bind(to: rx.openInternalInspectionCarBinding)
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: DetailVisualInspectionCarViewController {
    
    var openInternalInspectionCarBinding: Binder<Void> {
        return Binder(base) { viewController, _ in
            viewController.coordinator?.openInternalInspectionCar()
        }
    }
}

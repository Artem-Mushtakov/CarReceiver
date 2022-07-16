//
//  DetailVisualInspectionCarViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailVisualInspectionCarViewController: BaseViewController<DetailVisualInspectionCarView> {
    
    // MARK: - Properties
    
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
            .subscribe(onNext: { print("Tab save button") })
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: DetailVisualInspectionCarViewController { }

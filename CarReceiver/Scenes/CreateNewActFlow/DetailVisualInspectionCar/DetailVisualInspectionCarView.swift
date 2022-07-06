//
//  DetailVisualInspectionCarView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailVisualInspectionCarView: BaseView {
    
    // MARK: - Properties
    
    var tapNextStepButtonPublisher = PublishSubject<Void>()
    
    // MARK: - Ui elements
    
    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")
    
    // MARK: - Setup Layout
    
    override func setupHierarchy() {
        self.addSubview(nextStepButton)
    }
    
    override func setupLayout() {
        
        nextStepButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Binding
    
    override func setupBindingOutput() {
        
        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

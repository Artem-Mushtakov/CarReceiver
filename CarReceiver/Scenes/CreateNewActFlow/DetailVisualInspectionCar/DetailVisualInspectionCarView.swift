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
    
    private lazy var saveButton = NextStepButton(setTitle: "Сохранить")
    
    // MARK: - Setup Layout
    
    override func setupHierarchy() {
        self.addSubview(saveButton)
    }
    
    override func setupLayout() {
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Binding
    
    override func setupBindingOutput() {
        
        saveButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

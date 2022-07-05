//
//  VisualInspectionCarView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

class VisualInspectionCarView: BaseView {
    
    // MARK: - Properties
    
    var tapNextStepButtonPublisher = PublishSubject<Void>()
    
    // MARK: - Ui element
    
    private lazy var testLabel = CustomTextLabel(text: "Test Label", font: R.font.nunitoBold(size: 17).unsafelyUnwrapped, numberOfLines: 0)
    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")
    
    // MARK: - Setup Layout
    
    override func setupHierarchy() {
        self.addSubview(testLabel)
        self.addSubview(nextStepButton)
    }
    
    override func setupLayout() {
        
        testLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        nextStepButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: Private func
    
    // MARK: - Binding
    
    override func setupBindingOutput() {
        
        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

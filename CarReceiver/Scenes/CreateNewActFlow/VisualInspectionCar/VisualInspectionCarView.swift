//
//  VisualInspectionCarView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class VisualInspectionCarView: BaseView {
    
    // MARK: - Properties
    
    var tapNextStepButtonPublisher = PublishSubject<Void>()
    
    // MARK: - Ui element
    
    private lazy var isClearCarTitle = CustomTextLabel(text: "Автомобиль чистый?",
                                                       font: R.font.nunitoBold(size: 17).unsafelyUnwrapped, numberOfLines: 0).then {
        $0.textAlignment = .center
    }

    private lazy var isClearCarCheckYes = setupIsClearCarButton(setTitle: "Да")
    private lazy var isClearCarCheckNo = setupIsClearCarButton(setTitle: "Нет")
    
    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")
    
    // MARK: - Setup Layout
    
    override func setupHierarchy() {
        self.addSubview(isClearCarTitle)
        self.addSubview(nextStepButton)
        self.addSubview(isClearCarCheckYes)
        self.addSubview(isClearCarCheckNo)
    }
    
    override func setupLayout() {
        
        isClearCarTitle.snp.makeConstraints {
            $0.top.equalTo(UIScreen.main.bounds.height / 5.7)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        isClearCarCheckYes.snp.makeConstraints {
            $0.top.equalTo(isClearCarTitle.snp.bottom).offset(5)
            $0.centerX.equalTo(isClearCarTitle.snp.centerX).offset(-40)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }

        isClearCarCheckNo.snp.makeConstraints {
            $0.top.equalTo(isClearCarTitle.snp.bottom).offset(5)
            $0.centerX.equalTo(isClearCarTitle.snp.centerX).offset(40)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        
        nextStepButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: Private func

    private func setupIsClearCarButton(setTitle: String) -> UIButton {
        let button = UIButton(type: .system).then {
            $0.setTitle(setTitle, for: .normal)
            $0.tintColor = .black
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .lightGray
        }
        return button
    }
    
    // MARK: - Binding
    
    override func setupBindingOutput() {

        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

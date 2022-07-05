//
//  InternalInspectionCarView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

class InternalInspectionCarView: BaseView {

    // MARK: - Properties

    var tapNextStepButtonPublisher = PublishSubject<Void>()
    var odometrInfoTextFieldPublisher = PublishSubject<String>()
    var additionalEquipmentTextViewPublisher = PublishSubject<String>()

    // MARK: - Ui elements

    private lazy var odometrInfo = CustomTextField(isNeedSecure: false, placeholderTextField: "Пробег авто - Обязательное поле")
    private lazy var infoLabel = CustomTextLabel(text: "Введите в поле ниже, повреждения и дополнительное оборудование салона автомобиля",
                                                 font: R.font.nunitoSemiBold(size: 17).unsafelyUnwrapped,
                                                 numberOfLines: 3)

    private lazy var additionalEquipment = UITextView().then {
        $0.layer.backgroundColor = UIColor.white.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 4.0
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        $0.layer.shadowOpacity = 0.2
        $0.layer.masksToBounds = false
    }

    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")

    // MARK: - Setup Layout

    override func setupView() {
        super.setupView()
        infoLabel.textAlignment = .center
    }

    override func setupHierarchy() {
        self.addSubview(odometrInfo)
        self.addSubview(infoLabel)
        self.addSubview(additionalEquipment)
        self.addSubview(nextStepButton)
    }

    override func setupLayout() {

        odometrInfo.snp.makeConstraints {
            $0.top.equalTo(UIScreen.main.bounds.height / 5.7)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(odometrInfo.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        additionalEquipment.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.bottom.equalTo(nextStepButton.snp.top).offset(-20)
        }
        
        nextStepButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        odometrInfo.rx.text
            .orEmpty
            .bind(to: odometrInfoTextFieldPublisher)
            .disposed(by: disposeBag)

        additionalEquipment.rx.text
            .orEmpty
            .bind(to: additionalEquipmentTextViewPublisher)
            .disposed(by: disposeBag)

        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

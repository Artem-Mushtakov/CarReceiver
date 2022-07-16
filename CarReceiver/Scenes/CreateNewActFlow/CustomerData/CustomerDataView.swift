//
//  CustomerDataView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class CustomerDataView: BaseView {
    
    // MARK: - Properties

    var clientFullNamePublisher = PublishSubject<String>()
    var phoneNumberPublisher = PublishSubject<String>()
    var orderAnOutfitPublisher = PublishSubject<String>()
    var reasonsAappealPublisher = PublishSubject<String>()
    var tapNextStepButtonPublisher = PublishSubject<Void>()

    // MARK: - Ui elements

    private lazy var infoLabel = CustomTextLabel(text: "Для продолжения заполните обязательные поля",
                                                 font: R.font.nunitoBold(size: 17).unsafelyUnwrapped, numberOfLines: 3)

    private lazy var clientFullName = CustomTextField(isNeedSecure: false, placeholderTextField: "ФИО - Обязательное поле", delegate: self)
    private lazy var phoneNumber = CustomTextField(isNeedSecure: false, placeholderTextField: "Номер телефона - Обязательное поле", delegate: self)
    private lazy var orderAnOutfit = CustomTextField(isNeedSecure: false, placeholderTextField: "№ - Заказ наряда - Обязательное поле", delegate: self)
    private lazy var reasonsAappeal = createTextView(text: "")
    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(infoLabel)
        self.addSubview(clientFullName)
        self.addSubview(phoneNumber)
        self.addSubview(orderAnOutfit)
        self.addSubview(reasonsAappeal)
        self.addSubview(nextStepButton)
    }

    override func setupLayout() {

        infoLabel.snp.makeConstraints {
            $0.top.equalTo(UIScreen.main.bounds.height / 5.7)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        clientFullName.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }

        phoneNumber.snp.makeConstraints {
            $0.top.equalTo(clientFullName.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }

        orderAnOutfit.snp.makeConstraints {
            $0.top.equalTo(phoneNumber.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }

        reasonsAappeal.snp.makeConstraints {
            $0.top.equalTo(orderAnOutfit.snp.bottom).offset(20)
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

    // MARK: Private func

    private func createTextView(text: String) -> UITextView {
        let textView = UITextView().then {
            $0.text = text

            /// setup layer
            $0.layer.backgroundColor = UIColor.white.cgColor
            $0.layer.cornerRadius = 10
            $0.layer.shadowRadius = 4.0
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            $0.layer.shadowOpacity = 0.2
            $0.layer.masksToBounds = false
        }

        return textView
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        clientFullName.rx.text
            .orEmpty
            .bind(to: clientFullNamePublisher)
            .disposed(by: disposeBag)

        phoneNumber.rx.text
            .orEmpty
            .bind(to: phoneNumberPublisher)
            .disposed(by: disposeBag)

        orderAnOutfit.rx.text
            .orEmpty
            .bind(to: orderAnOutfitPublisher)
            .disposed(by: disposeBag)

        reasonsAappeal.rx.text
            .orEmpty
            .bind(to: reasonsAappealPublisher)
            .disposed(by: disposeBag)

        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

// MARK: - TextField Delegate

extension CustomerDataView: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let clientFullNameTextIsEmpty = clientFullName.text?.isEmpty else { return }
        guard let phoneNumberTextIsEmpty = phoneNumber.text?.isEmpty else { return }
        guard let orderAnOutfitTextIsEmpty = orderAnOutfit.text?.isEmpty else { return }
        
        if !clientFullNameTextIsEmpty && !phoneNumberTextIsEmpty && !orderAnOutfitTextIsEmpty {
            self.nextStepButton.backgroundColor = .green
            self.nextStepButton.isEnabled = true
        } else {
            self.nextStepButton.backgroundColor = .gray
            self.nextStepButton.isEnabled = false
        }
    }
}

// MARK: - TextView Delegate

extension CustomerDataView: UITextViewDelegate {

}

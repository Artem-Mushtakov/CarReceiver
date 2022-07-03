//
//  SettingsView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SettingsView: BaseView {
    
    // MARK: - Properties

    var unlockSettingsButtonPublisher = PublishSubject<Void>()
    var changeOrganizationNamePublisher = PublishSubject<String>()
    var changeOrganizationAddressPublisher = PublishSubject<String>()
    var changeOrganizationPhonePublisher = PublishSubject<String>()
    var changePrefixActPublisher = PublishSubject<String>()
    var saveSettingsButtonPublisher = PublishSubject<Void>()
    var removeAccountButtonPublisher = PublishSubject<Void>()

    // MARK: - Ui elements

    private lazy var infoLabel = UILabel().then {
        $0.text = "Нажмите разблокировать для внесения изменений, после изменений нажмите сохранить"
        $0.font = R.font.nunitoRegular(size: 17)
        $0.textColor  = .black
        $0.textAlignment = .left
        $0.numberOfLines = 3
    }

    private lazy var unlockSettingsButton = createButton(setTitle: "Разблокировать для изменения")
    private lazy var changeOrganizationName = CustomTextField(isNeedSecure: false, placeholderTextField: "Название организации")
    private lazy var changeOrganizationAddress = CustomTextField(isNeedSecure: false, placeholderTextField: "Адрес организации")
    private lazy var changeOrganizationPhone = CustomTextField(isNeedSecure: false, placeholderTextField: "Контактный телефон")
    private lazy var changePrefixActNumber = CustomTextField(isNeedSecure: false, placeholderTextField: "Акт префикс")
    private lazy var saveSettingsButton = createButton(setTitle: "Сохранить")

    private lazy var removeAccountButton = UIButton().then {
        $0.setTitle("Удалить аккаунт", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 18)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.borderWidth = 2
    }

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(infoLabel)
        self.addSubview(unlockSettingsButton)
        self.addSubview(changeOrganizationName)
        self.addSubview(changeOrganizationAddress)
        self.addSubview(changeOrganizationPhone)
        self.addSubview(changePrefixActNumber)
        self.addSubview(saveSettingsButton)
        self.addSubview(removeAccountButton)
    }

    override func setupLayout() {

        infoLabel.snp.makeConstraints {
            $0.top.equalTo(UIScreen.main.bounds.height / 5.5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        unlockSettingsButton.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        changeOrganizationName.snp.makeConstraints {
            $0.top.equalTo(unlockSettingsButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        changeOrganizationAddress.snp.makeConstraints {
            $0.top.equalTo(changeOrganizationName.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        changeOrganizationPhone.snp.makeConstraints {
            $0.top.equalTo(changeOrganizationAddress.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        changePrefixActNumber.snp.makeConstraints {
            $0.top.equalTo(changeOrganizationPhone.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        saveSettingsButton.snp.makeConstraints {
            $0.top.equalTo(changePrefixActNumber.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        removeAccountButton.snp.makeConstraints {
            $0.top.equalTo(saveSettingsButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
    }

    // MARK: - Create ui function

    private func createButton(setTitle: String) -> UIButton {
        let button = UIButton().then {
            $0.setTitle(setTitle, for: .normal)
            $0.titleLabel?.font = R.font.nunitoBold(size: 18)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = R.color.borderOrange()?.cgColor
            $0.layer.borderWidth = 2
        }
        return button
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        unlockSettingsButton.rx.tap
            .bind(to: unlockSettingsButtonPublisher)
            .disposed(by: disposeBag)

        changeOrganizationName.rx.text
            .orEmpty
            .bind(to: changeOrganizationNamePublisher)
            .disposed(by: disposeBag)

        changeOrganizationAddress.rx.text
            .orEmpty
            .bind(to: changeOrganizationAddressPublisher)
            .disposed(by: disposeBag)

        changeOrganizationPhone.rx.text
            .orEmpty
            .bind(to: changeOrganizationPhonePublisher)
            .disposed(by: disposeBag)

        changePrefixActNumber.rx.text
            .orEmpty
            .bind(to: changePrefixActPublisher)
            .disposed(by: disposeBag)

        saveSettingsButton.rx.tap
            .bind(to: saveSettingsButtonPublisher)
            .disposed(by: disposeBag)

        removeAccountButton.rx.tap
            .bind(to: removeAccountButtonPublisher)
            .disposed(by: disposeBag)
    }
}

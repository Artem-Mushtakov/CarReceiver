//
//  RegistrationView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 20.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class RegistrationView: BaseView {

    // MARK: - Properties

    var loginTextFieldPublisher = PublishSubject<String>()
    var organizationNameTextFieldPublisher = PublishSubject<String>()
    var passwordTextFieldPublisher = PublishSubject<String>()
    var repeatThePasswordTextFieldPublisher = PublishSubject<String>()
    var tapRegistrationButtonPublisher = PublishSubject<Void>()

    // MARK: - Ui elements

    private lazy var logoImageView = UIImageView().then {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        let logoImage = UIImage(systemName: "car.2", withConfiguration: largeConfig)
        $0.image = logoImage
        $0.tintColor = R.color.orangeColor()?.withAlphaComponent(0.6)
    }

    private lazy var loginTextField = CustomTextField(false).then {
        $0.placeholder = "Введите логин или email"
        $0.font = R.font.nunitoRegular(size: 14)
        $0.tintColor = .gray
    }

    private lazy var organizationNameTextField = CustomTextField(false).then {
        $0.placeholder = "Название организации"
        $0.font = R.font.nunitoRegular(size: 14)
        $0.tintColor = .gray
    }

    private lazy var passwordTextField = CustomTextField(true).then {
        $0.placeholder = "Введите пароль"
        $0.font = R.font.nunitoRegular(size: 14)
        $0.tintColor = .gray
    }

    private lazy var repeatThePassword = CustomTextField(true).then {
        $0.placeholder = "Повторите ввод пароля"
        $0.font = R.font.nunitoRegular(size: 14)
        $0.tintColor = .gray
    }

    private lazy var registerButton = UIButton(type: .system).then {
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 18)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = R.color.borderOrange()?.cgColor
        $0.layer.borderWidth = 2
    }

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(logoImageView)
        self.addSubview(loginTextField)
        self.addSubview(organizationNameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(repeatThePassword)
        self.addSubview(registerButton)
    }

    override func setupLayout() {

        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(UIScreen.main.bounds.height / 3)
        }

        loginTextField.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        organizationNameTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(organizationNameTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        repeatThePassword.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        registerButton.snp.makeConstraints {
            $0.top.equalTo(repeatThePassword.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        loginTextField.rx.text
            .orEmpty
            .bind(to: loginTextFieldPublisher)
            .disposed(by: disposeBag)

        organizationNameTextField.rx.text
            .orEmpty
            .bind(to: organizationNameTextFieldPublisher)
            .disposed(by: disposeBag)

        passwordTextField.rx.text
            .orEmpty
            .bind(to: passwordTextFieldPublisher)
            .disposed(by: disposeBag)

        repeatThePassword.rx.text
            .orEmpty
            .bind(to: repeatThePasswordTextFieldPublisher)
            .disposed(by: disposeBag)

        registerButton.rx.tap
            .bind(to: tapRegistrationButtonPublisher)
            .disposed(by: disposeBag)
    }
}

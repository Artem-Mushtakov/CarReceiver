//
//  LoginView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 20.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginView: BaseView {

    // MARK: - Properties

    var loginTextFieldPublisher = PublishSubject<String>()
    var passwordTextFieldPublisher = PublishSubject<String>()
    var tapResetPasswordButtonPublisher = PublishSubject<Void>()
    var tapLoginButtonPublisher = PublishSubject<Void>()
    var tapRegistrationButtonPublisher = PublishSubject<Void>()

    // MARK: - Ui elements

    private lazy var logoImageView = UIImageView().then {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        let logoImage = UIImage(systemName: "car.2", withConfiguration: largeConfig)
        $0.image = logoImage
        $0.tintColor = R.color.orangeColor()?.withAlphaComponent(0.6)
    }

    private lazy var loginTextField = CustomTextField(isNeedSecure: false, placeholderTextField: "Введите логин")
    private lazy var passwordTextField = CustomTextField(isNeedSecure: true, placeholderTextField: "Введите пароль")

    private lazy var resetPassword = UIButton().then {
        $0.setTitle("Забыли пароль?", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 17)
        $0.setTitleColor(.black, for: .normal)
    }

    private lazy var loginButton = setupButton(setTitle: "Войти")
    private lazy var registerButton = setupButton(setTitle: "Зарегистрироваться")

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(logoImageView)
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
        self.addSubview(resetPassword)
        self.addSubview(loginButton)
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

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        resetPassword.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(20)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(resetPassword.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        registerButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
    }

    // MARK: - Setup Ui elements functions

    private func setupButton(setTitle: String) -> UIButton {
        let button = UIButton(type: .system).then {
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

        loginTextField.rx.text
            .orEmpty
            .bind(to: loginTextFieldPublisher)
            .disposed(by: disposeBag)

        passwordTextField.rx.text
            .orEmpty
            .bind(to: passwordTextFieldPublisher)
            .disposed(by: disposeBag)

        resetPassword.rx.tap
            .bind(to: tapResetPasswordButtonPublisher)
            .disposed(by: disposeBag)

        loginButton.rx.tap
            .bind(to: tapLoginButtonPublisher)
            .disposed(by: disposeBag)

        registerButton.rx.tap
            .bind(to: tapRegistrationButtonPublisher)
            .disposed(by: disposeBag)
    }
}

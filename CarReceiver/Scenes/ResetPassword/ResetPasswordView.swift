//
//  ResetPasswordView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 22.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class ResetPasswordView: BaseView {

    // MARK: - Properties

    var tapResetPasswordPublisher = PublishSubject<Void>()
    var sendTextEmailPublisher = PublishSubject<String>()

    // MARK: - Ui elements

    private lazy var logoImageView = UIImageView().then {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        let logoImage = UIImage(systemName: "car.2", withConfiguration: largeConfig)
        $0.image = logoImage
        $0.tintColor = R.color.orangeColor()?.withAlphaComponent(0.6)
    }

    private lazy var emailLabel = UILabel().then {
        $0.text = "Введите ваш email, на него будет отправлена форма восстановления пароля."
        $0.font = R.font.nunitoBold(size: 17)
        $0.numberOfLines = 3
        $0.textAlignment = .center
    }

    private lazy var emailTextField = CustomTextField(isNeedSecure: false, placeholderTextField: "Email")
    private lazy var sendResetPasswordButton = setupButton(setTitle: "Отправить")
    
    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(sendResetPasswordButton)
    }

    override func setupLayout() {

        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(UIScreen.main.bounds.height / 3)
        }

        emailLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(50)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(30)
        }

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }

        sendResetPasswordButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
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

        emailTextField.rx.text
            .orEmpty
            .bind(to: sendTextEmailPublisher)
            .disposed(by: disposeBag)

        sendResetPasswordButton.rx.controlEvent(.touchUpInside)
            .bind(to: tapResetPasswordPublisher)
            .disposed(by: disposeBag)
    }
}


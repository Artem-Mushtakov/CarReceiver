//
//  StartView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 20.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class StartView: BaseView {

    // MARK: - Properties

    var openRegistrationViewControllerPublisher = PublishSubject<Void>()
    var openLoginViewControllerPublisher = PublishSubject<Void>()

    // MARK: - Ui elements

    private lazy var logoImageView = UIImageView().then {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        let logoImage = UIImage(systemName: "car.2", withConfiguration: largeConfig)
        $0.image = logoImage
        $0.tintColor = R.color.orangeColor()?.withAlphaComponent(0.6)
    }

    private lazy var enterLoginButton = UIButton(type: .system).then {
        $0.setTitle("Войти", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 18)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = R.color.borderOrange()?.cgColor
        $0.layer.borderWidth = 2
    }

    private lazy var registrationButton = UIButton(type: .system).then {
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
        self.addSubview(enterLoginButton)
        self.addSubview(registrationButton)
    }

    override func setupLayout() {

        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(UIScreen.main.bounds.height / 3)
        }

        enterLoginButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        registrationButton.snp.makeConstraints {
            $0.centerY.equalTo(enterLoginButton.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        enterLoginButton.rx.tap
            .bind(to: openLoginViewControllerPublisher)
            .disposed(by: disposeBag)

        registrationButton.rx.tap
            .bind(to: openRegistrationViewControllerPublisher)
            .disposed(by: disposeBag)
    }
}

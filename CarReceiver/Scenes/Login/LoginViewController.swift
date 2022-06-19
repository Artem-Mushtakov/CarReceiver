//
//  LoginViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 14.06.2022.
//

import UIKit
import Rswift
import RxCocoa
import RxSwift
import Then
import SnapKit

class LoginViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setup view

    private func setupView() {
        title = "Main"
        view.backgroundColor = .white
        addSubviews()
        setupNavigationController()
        setupLayout()
    }

    private func setupNavigationController() {
        let apperiance = UINavigationBarAppearance()
        apperiance.backgroundColor = R.color.orangeColor()
        apperiance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = apperiance
        navigationController?.navigationBar.scrollEdgeAppearance = apperiance
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Ui elements

    private lazy var contentView = UIImageView().then {
        $0.image = R.image.backgroundImage()
        $0.contentMode = .scaleAspectFill
    }

    private lazy var logoImageView = UIImageView().then {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        let logoImage = UIImage(systemName: "car.2", withConfiguration: largeConfig)
        $0.image = logoImage
        $0.tintColor = R.color.orangeColor()?.withAlphaComponent(0.6)
    }

    private lazy var loginTextField = CustomTextField(false).then {
        $0.placeholder = "Введите логин"
        $0.font = R.font.nunitoRegular(size: 14)
        $0.tintColor = .lightGray
    }

    private lazy var passwordTextField = CustomTextField(true).then {
        $0.placeholder = "Введите пароль"
        $0.font = R.font.nunitoRegular(size: 14)
        $0.tintColor = .gray
    }

    private lazy var resetPassword = UIButton().then {
        $0.setTitle("Забыли пароль?", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 17)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(openModuleResetPassword), for: .touchUpInside)
    }
    
    private lazy var loginButton = UIButton(type: .system).then {
        $0.setTitle("Войти", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 18)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor(displayP3Red: 255/255, green: 183/255, blue:  86/255, alpha:1).cgColor
        $0.layer.borderWidth = 2
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    // MARK: - Setup Layout

    private func addSubviews() {
        view.addSubview(contentView)
        view.addSubview(logoImageView)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(resetPassword)
        view.addSubview(loginButton)
    }

    private func setupLayout() {

        contentView.snp.makeConstraints {
            $0.center.height.width.equalToSuperview()
        }

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
            $0.width.equalTo(view.frame.width * 0.5)
            $0.height.equalTo(view.frame.height * 0.06)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }

    @objc private func openModuleResetPassword() {
        print("Open reset password")
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
    }
}

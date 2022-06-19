//
//  StartViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 19.06.2022.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setup view

    private func setupView() {
        title = "Добро пожаловать"
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

    private lazy var enterLoginButton = UIButton(type: .system).then {
        $0.setTitle("Войти", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 18)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = R.color.borderOrange()?.cgColor
        $0.layer.borderWidth = 2
        $0.addTarget(self, action: #selector(enterLoginButtonTapped), for: .touchUpInside)
    }

    private lazy var registrationButton = UIButton(type: .system).then {
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.titleLabel?.font = R.font.nunitoBold(size: 18)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = R.color.borderOrange()?.cgColor
        $0.layer.borderWidth = 2
        $0.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
    }

    // MARK: - Setup Layout

    private func addSubviews() {
        view.addSubview(contentView)
        view.addSubview(logoImageView)
        view.addSubview(enterLoginButton)
        view.addSubview(registrationButton)
    }

    private func setupLayout() {

        contentView.snp.makeConstraints {
            $0.center.height.width.equalToSuperview()
        }

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

    @objc private func registrationButtonTapped() {
        print(#function)
        let viewController = RegistrationViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func enterLoginButtonTapped() {
        print(#function)
        let viewController = LoginViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

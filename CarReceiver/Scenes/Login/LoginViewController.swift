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
        view.addSubview(contentView)
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

    private func setupLayout() {

        contentView.snp.makeConstraints {
            $0.center.height.width.equalToSuperview()
        }
    }
}

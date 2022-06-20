//
//  BaseViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 20.06.2022.
//

import UIKit
import RxSwift

class BaseViewController<View>: UIViewController where View: UIView {

    // MARK: Properties

    let contentView = View()

    // MARK: - Reactive

    let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        setupNavigationController()
    }

    override func loadView() {
        view = contentView
    }

    // MARK: - Setup view

    func commonInit() {
        setupBindingOutput()
        setupBindingInput()
    }

    private func setupView() {
        view.backgroundColor = .white
        addSubviews()
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

    lazy var backgroundContentView = UIImageView().then {
        $0.image = R.image.backgroundImage()
        $0.contentMode = .scaleAspectFill
    }

    // MARK: - Setup Layout

    private func addSubviews() {
        view.addSubview(contentView)
    }

    private func setupLayout() {

        contentView.snp.makeConstraints {
            $0.center.height.width.equalToSuperview()
        }
    }

    // MARK: - Reactive

    func setupBindingOutput() { }
    func setupBindingInput() { }
}

//
//  VisualInspectionCarIsClearCell.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 11.07.2022.
//

import UIKit

final class VisualInspectionCarIsClearCell: UICollectionViewCell {

    // MARK: - Ui element

    private lazy var isClearCarTitle = CustomTextLabel(text: "Автомобиль чистый?",
                                                       font: R.font.nunitoBold(size: 17).unsafelyUnwrapped, numberOfLines: 0).then {
        $0.textAlignment = .center
    }

    private lazy var isClearCarCheckYesButton = setupIsClearCarButton(setTitle: "Да")
    private lazy var isClearCarCheckNoButton = setupIsClearCarButton(setTitle: "Нет")

    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup view functions

    private func setupView() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup Layout

    private func setupHierarchy() {
        self.addSubview(isClearCarTitle)
        self.addSubview(isClearCarCheckYesButton)
        self.addSubview(isClearCarCheckNoButton)
    }

    private func setupLayout() {

        isClearCarTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        isClearCarCheckYesButton.snp.makeConstraints {
            $0.top.equalTo(isClearCarTitle.snp.bottom).offset(5)
            $0.centerX.equalTo(isClearCarTitle.snp.centerX).offset(-40)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }

        isClearCarCheckNoButton.snp.makeConstraints {
            $0.top.equalTo(isClearCarTitle.snp.bottom).offset(5)
            $0.centerX.equalTo(isClearCarTitle.snp.centerX).offset(40)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
    }

    // MARK: Private func

    private func setupIsClearCarButton(setTitle: String) -> UIButton {
        let button = UIButton(type: .system).then {
            $0.setTitle(setTitle, for: .normal)
            $0.tintColor = .black
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .lightGray
        }
        return button
    }
}

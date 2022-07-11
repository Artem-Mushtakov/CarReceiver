//
//  VisualInspectionCarCell.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 11.07.2022.
//

import UIKit

final class VisualInspectionCarCell: UICollectionViewCell {

    // MARK: - Ui element

    private lazy var titleCarLabel = CustomTextLabel(text: "Тест", font: R.font.nunitoSemiBold(size: 14).unsafelyUnwrapped, numberOfLines: 0)
    private lazy var carImageView = UIImageView().then {
        $0.backgroundColor = .gray
    }

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
        self.addSubview(titleCarLabel)
        self.addSubview(carImageView)
    }

    private func setupLayout() {

        titleCarLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(40)
        }

        carImageView.snp.makeConstraints {
            $0.top.equalTo(titleCarLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
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

    // MARK: - Load data cell

    func loadDataCell(titleLabel: String, image: UIImage?) {
        guard let image = image else { return }
        self.titleCarLabel.text = titleLabel
        self.carImageView.image = image
    }
}


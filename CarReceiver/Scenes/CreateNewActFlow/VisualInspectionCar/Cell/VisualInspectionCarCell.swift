//
//  VisualInspectionCarCell.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 11.07.2022.
//

import UIKit

final class VisualInspectionCarCell: UICollectionViewCell {

    // MARK: - Ui element

    private lazy var titleCarLabel = CustomTextLabel(text: "Тест", font: R.font.nunitoBold(size: 17).unsafelyUnwrapped, numberOfLines: 0).then {
        $0.textAlignment = .center
    }

    private lazy var carImageView = setupUiImageViewShadow(imageView: UIImageView()).then {
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
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        carImageView.snp.makeConstraints {
            $0.top.equalTo(titleCarLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(UIScreen.main.bounds.width - 40)
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

    private func setupUiImageViewShadow(imageView: UIImageView) -> UIImageView {
        imageView.layer.backgroundColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowRadius = 4.0
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.masksToBounds = false
        return imageView
    }

    // MARK: - Load data cell

    func loadDataCell(titleLabel: String?, image: UIImage?) {
        guard let image = image, let titleLabel = titleLabel  else { return }
        self.titleCarLabel.text = titleLabel
        self.carImageView.image = image
    }
}


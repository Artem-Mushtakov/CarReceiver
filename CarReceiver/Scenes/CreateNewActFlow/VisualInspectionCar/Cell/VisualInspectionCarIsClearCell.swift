//
//  VisualInspectionCarIsClearCell.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 11.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class VisualInspectionCarIsClearCell: BaseCollectionViewCell {

    // MARK: Properties

    var clearCarYesButtonPublisher = PublishSubject<Void>()
    var clearCarNoButtonPublisher = PublishSubject<Void>()

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
            $0.isUserInteractionEnabled = true
            $0.tintColor = .black
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .lightGray
            $0.addTarget(self, action: #selector(selectedColorButton), for: .touchUpInside)
        }
        return button
    }

    @objc private func selectedColorButton(sender: UIButton) {
        isClearCarCheckYesButton.tag = 0
        isClearCarCheckNoButton.tag = 1

        switch sender.tag {
        case 0:
            isClearCarCheckYesButton.backgroundColor = R.color.orangeColor()
            isClearCarCheckNoButton.backgroundColor = .lightGray
            isClearCarCheckYesButton.isUserInteractionEnabled = false
            isClearCarCheckNoButton.isUserInteractionEnabled = true
        case 1:
            isClearCarCheckNoButton.backgroundColor = R.color.orangeColor()
            isClearCarCheckYesButton.backgroundColor = .lightGray
            isClearCarCheckNoButton.isUserInteractionEnabled = false
            isClearCarCheckYesButton.isUserInteractionEnabled = true
        default:
            fatalError("Button tap error")
        }
    }

    // MARK: - Load data cell

    func loadDataCell(titleLabel: String?) {
        guard let titleLabel = titleLabel  else { return }
        self.isClearCarTitle.text = titleLabel
        binding()
    }

    // MARK: - Reactiva bind

    private func binding() {

        isClearCarCheckYesButton.rx.controlEvent(.touchUpInside)
            .bind(to: clearCarYesButtonPublisher)
            .disposed(by: disposeBag)

        isClearCarCheckNoButton.rx.controlEvent(.touchUpInside)
            .bind(to: clearCarNoButtonPublisher)
            .disposed(by: disposeBag)
    }
}

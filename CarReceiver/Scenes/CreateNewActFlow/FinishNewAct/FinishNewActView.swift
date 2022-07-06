//
//  FinishNewActView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class FinishNewActView: BaseView {

    // MARK: - Properties

    var sharedDoneActPublisher = PublishSubject<Void>()

    // MARK: - Ui elements

    private lazy var infoLabel = CustomTextLabel(text: "Готовый АКТ, нажмите для предварительного просмотра ",
                                                 font: R.font.nunitoSemiBold(size: 17).unsafelyUnwrapped,
                                                 numberOfLines: 2)

    private lazy var doneActPDF = UIImageView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
    }

    private lazy var sharedDoneAct = createButton(setTitle: "Поделится", font: R.font.nunitoBold(size: 17).unsafelyUnwrapped)

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(infoLabel)
        self.addSubview(doneActPDF)
        self.addSubview(sharedDoneAct)
    }

    override func setupView() {
        super.setupView()
        infoLabel.textAlignment = .center
    }

    override func setupLayout() {

        infoLabel.snp.makeConstraints {
            $0.top.equalTo(UIScreen.main.bounds.height / 5.7)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        doneActPDF.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.bottom.equalTo(sharedDoneAct.snp.top).offset(-20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        sharedDoneAct.snp.makeConstraints {
            $0.bottom.equalTo(-50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
    }

    // MARK: Private func

    private func createButton(setTitle: String, font: UIFont) -> UIButton {
        let button = UIButton(type: .system).then {
            $0.setTitle(setTitle, for: .normal)
            $0.titleLabel?.font = font
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

        sharedDoneAct.rx.tap
            .bind(to: sharedDoneActPublisher)
            .disposed(by: disposeBag)
    }
}

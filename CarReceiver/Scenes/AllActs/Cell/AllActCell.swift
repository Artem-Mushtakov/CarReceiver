//
//  AllActCell.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 05.07.2022.
//

import UIKit

final class AllActCell: UICollectionViewCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI elements

    private lazy var contentViewAllAct = UIView().then {
        $0.layer.backgroundColor = UIColor.white.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 4.0
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        $0.layer.shadowOpacity = 0.2
        $0.layer.masksToBounds = false
    }

    private lazy var dateAct = UILabel().then {
        $0.font = R.font.nunitoSemiBold(size: 14)
        $0.textColor = .gray
    }

    private lazy var numberAct = UILabel().then {
        $0.font = R.font.nunitoBold(size: 17)
        $0.textColor = .black
    }

    private lazy var nameCar = UILabel().then {
        $0.font = R.font.nunitoSemiBold(size: 17)
        $0.textColor = .black
    }

    private lazy var numberCar = UILabel().then {
        $0.font = R.font.nunitoSemiBold(size: 17)
        $0.textColor = .black
    }

    private lazy var dateOfAdmissionCar = UILabel().then {
        $0.font = R.font.nunitoRegular(size: 17)
        $0.textColor = .black
    }

    private lazy var dateOfIssue = UILabel().then {
        $0.font = R.font.nunitoRegular(size: 17)
        $0.textColor = .black
    }

    // MARK: - Setup view functions

    private func setupView() {
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        self.addSubview(contentViewAllAct)
        contentViewAllAct.addSubview(numberAct)
        contentViewAllAct.addSubview(nameCar)
        contentViewAllAct.addSubview(numberCar)
        contentViewAllAct.addSubview(dateOfAdmissionCar)
        contentViewAllAct.addSubview(dateOfIssue)
    }

    private func setupLayout() {

        contentViewAllAct.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(100)
        }

        numberAct.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(20)
        }

        nameCar.snp.makeConstraints {
            $0.top.equalTo(numberAct.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(20)
        }

        numberCar.snp.makeConstraints {
            $0.top.equalTo(nameCar.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(20)
        }

        dateOfAdmissionCar.snp.makeConstraints {
            $0.top.equalTo(nameCar.snp.top)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(20)
        }

        dateOfIssue.snp.makeConstraints {
            $0.top.equalTo(dateOfAdmissionCar.snp.bottom).offset(10)
            $0.leading.equalTo(dateOfAdmissionCar.snp.leading)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(20)
        }
    }

    // MARK: - Load data cell

    func loadDataCell(numberAct: String, nameCar: String, numberCar: String, dateOfAdmissionCar: String, dateOfIssue: String) {
        self.numberAct.text = "АКТ №\(numberAct)"
        self.nameCar.text = nameCar
        self.numberCar.text = numberCar
        self.dateOfAdmissionCar.text = "Приняли: \(dateOfAdmissionCar)"
        self.dateOfIssue.text = "Выдали:  \(dateOfIssue)"
    }
}

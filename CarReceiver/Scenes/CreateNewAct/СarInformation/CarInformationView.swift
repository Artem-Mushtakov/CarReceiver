//
//  CarInformationView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

class CarInformationView: BaseView {
    
    // MARK: - Properties
    
    var brandCarPublisher = PublishSubject<String>()
    var modelCarPublisher = PublishSubject<String>()
    var yearCarPublisher = PublishSubject<String>()
    var numberCarPublisher = PublishSubject<String>()
    var vinPublisher = PublishSubject<String>()
    var tapNextStepButtonPublisher = PublishSubject<Void>()
    
    // MARK: - Ui elements
    
    private lazy var brandCarTextField = CustomTextLabel(text: "Для продолжения заполните обязательные поля",
                                                         font: .boldSystemFont(ofSize: 17),
                                                         numberOfLines: 3)
    
    private lazy var modelCarTextField = CustomTextField(isNeedSecure: false, placeholderTextField: "Марка - Обязательное поле", delegate: self)
    private lazy var yearCarTextField = CustomTextField(isNeedSecure: false, placeholderTextField: "Год выпуска - Обязательное поле", delegate: self)
    private lazy var numberCarTextField = CustomTextField(isNeedSecure: false, placeholderTextField: "Гос. номер - Обязательное поле", delegate: self)
    private lazy var vinTextField = CustomTextField(isNeedSecure: false, placeholderTextField: "VIN - Обязательное поле", delegate: self)
    
    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")
    
    // MARK: - Setup Layout
    
    override func setupHierarchy() {
        self.addSubview(brandCarTextField)
        self.addSubview(modelCarTextField)
        self.addSubview(yearCarTextField)
        self.addSubview(numberCarTextField)
        self.addSubview(vinTextField)
        self.addSubview(nextStepButton)
    }
    
    override func setupLayout() {
        
        brandCarTextField.snp.makeConstraints {
            $0.top.equalTo(UIScreen.main.bounds.height / 5.7)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        modelCarTextField.snp.makeConstraints {
            $0.top.equalTo(brandCarTextField.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }
        
        yearCarTextField.snp.makeConstraints {
            $0.top.equalTo(modelCarTextField.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }
        
        numberCarTextField.snp.makeConstraints {
            $0.top.equalTo(yearCarTextField.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }
        
        vinTextField.snp.makeConstraints {
            $0.top.equalTo(numberCarTextField.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }
        
        nextStepButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }

    // MARK: - Binding
    
    override func setupBindingOutput() {
        
        modelCarTextField.rx.text
            .orEmpty
            .bind(to: modelCarPublisher)
            .disposed(by: disposeBag)
        
        yearCarTextField.rx.text
            .orEmpty
            .bind(to: yearCarPublisher)
            .disposed(by: disposeBag)
        
        numberCarTextField.rx.text
            .orEmpty
            .bind(to: numberCarPublisher)
            .disposed(by: disposeBag)
        
        vinTextField.rx.text
            .orEmpty
            .bind(to: vinPublisher)
            .disposed(by: disposeBag)
        
        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}


// MARK: - TextField Delegate

extension CarInformationView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let modelCarTextIsEmpty = modelCarTextField.text?.isEmpty else { return }
        guard let yearCarTextIsEmpty = yearCarTextField.text?.isEmpty else { return }
        guard let numberCarTextIsEmpty = numberCarTextField.text?.isEmpty else { return }
        guard let vinTextIsEmpty = vinTextField.text?.isEmpty else { return }
        
        if !modelCarTextIsEmpty && !yearCarTextIsEmpty && !numberCarTextIsEmpty && !vinTextIsEmpty {
            self.nextStepButton.backgroundColor = .green
            self.nextStepButton.isEnabled = true
        } else {
            self.nextStepButton.backgroundColor = .gray
            self.nextStepButton.isEnabled = false
        }
    }
}

// MARK: - TextView Delegate

extension CarInformationView: UITextViewDelegate {
    
}

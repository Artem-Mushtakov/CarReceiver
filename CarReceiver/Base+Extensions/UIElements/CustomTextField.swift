//
//  CustomTextField.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 16.06.2022.
//

import UIKit

class CustomTextField: UITextField {

    // MARK: - Initial

    private var isNeedSecure: Bool
    
    init(_ isNeedSecure: Bool) {
        self.isNeedSecure = isNeedSecure
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        self.isSecureTextEntry = isNeedSecure
        setupTextFieldView()
    }

    private func setupTextFieldView() {
        
        /// left view
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always

        /// right view
        if isNeedSecure {
            self.rightView = isSecureButton
            self.rightViewMode = .always
        }
        /// setup layer
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
        self.layer.shadowRadius = 4.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
    }

    // MARK: - UI elements

    private lazy var isSecureButton = UIButton().then {
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        $0.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        $0.setImage(UIImage(systemName: "lock.open.fill"), for: .selected)
        $0.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func showHidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
}

//
//  NextStepButton.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

class NextStepButton: UIButton {

    // MARK: - Properties

    private let setTitle: String

    // MARK: - Initial

    required init(setTitle: String) {
        self.setTitle = setTitle
        super.init(frame: .zero)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupButton() {
        self.setTitle(setTitle, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = R.font.nunitoBold(size: 17)
        self.layer.cornerRadius = 10
        self.backgroundColor = .green
    }
}

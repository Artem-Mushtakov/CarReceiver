//
//  CustomTextLabel.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

class CustomTextLabel: UILabel {

    // MARK: - Initial

    init(text: String, font: UIFont, numberOfLines: Int?) {
        super.init(frame: .zero)
        setupLabel(text: text, font: font,numberOfLines: numberOfLines)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupLabel(text: String, font: UIFont, numberOfLines: Int?) {
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines ?? 0
    }
}

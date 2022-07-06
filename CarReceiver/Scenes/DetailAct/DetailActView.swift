//
//  DetailActView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailActView: BaseView {
    
    // MARK: - Properties

    // MARK: - Ui elements

    private lazy var testLabel = UILabel().then {
        $0.text = "DetailActView"
        $0.font = .boldSystemFont(ofSize: 17)
    }

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(testLabel)
    }

    override func setupLayout() {

        testLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() { }
}

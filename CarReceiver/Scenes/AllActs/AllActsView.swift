//
//  AllActsView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class AllActsView: BaseView {

    // MARK: - Properties

    var tapBarButtonItemPublisher = PublishSubject<Void>()
    
    // MARK: - Ui elements

    lazy var barButtonItem = NextStepButton(setTitle: "Создать новый АКТ").then {
        $0.frame.size.width = 200
        $0.backgroundColor = .lightText
        $0.layer.masksToBounds = false
    }

    private lazy var testLabel = UILabel().then {
        $0.text = "Все акты"
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

    override func setupBindingOutput() {

        barButtonItem.rx.tap
            .bind(to: tapBarButtonItemPublisher)
            .disposed(by: disposeBag)
    }
}

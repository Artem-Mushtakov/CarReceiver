//
//  BaseView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 20.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class BaseView: UIView {

    // MARK: - Reactive

    let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Settings

    func commonInit() {
        setupView()
        setupHierarchy()
        setupLayout()
        setupBindingOutput()
    }

    func setupHierarchy() { }

    func setupLayout() { }

    func setupView() {
        backgroundColor = .white
    }

    func setupBindingOutput() { }
}

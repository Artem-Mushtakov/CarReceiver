//
//  SettingsViewController.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class SettingsViewController: BaseViewController<SettingsView> {

    // MARK: - Properties

    var coordinator: SettingsCoordinatorFlow?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
    }

    // MARK: - Binding

    override func setupBindingInput() {

        contentView.unlockSettingsButtonPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.changeOrganizationNamePublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.changeOrganizationAddressPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.changeOrganizationPhonePublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.changePrefixActPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.saveSettingsButtonPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)

        contentView.removeAccountButtonPublisher
            .subscribe { text in print(text) }
            .disposed(by: disposeBag)
    }
}

// MARK: - Extension Reactive

extension Reactive where Base: SettingsViewController { }

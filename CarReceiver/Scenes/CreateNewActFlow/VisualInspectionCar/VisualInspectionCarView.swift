//
//  VisualInspectionCarView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class VisualInspectionCarView: BaseView {
    
    // MARK: - Properties
    
    var tapNextStepButtonPublisher = PublishSubject<Void>()
    var clearCarYesButtonPublisher = PublishSubject<Void>()
    var clearCarNoButtonPublisher = PublishSubject<Void>()
    var visualDataPublisher = PublishSubject<[SectionVisualInspectionCarModel]>()
    var tapItemCollectionView = PublishSubject<IndexPath>()
    
    // MARK: - Ui element

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        $0.showsVerticalScrollIndicator = false
        $0.register(VisualInspectionCarCell.self, forCellWithReuseIdentifier: "VisualInspectionCarCell")
        $0.register(VisualInspectionCarIsClearCell.self, forCellWithReuseIdentifier: "VisualInspectionCarIsClearCell")
    }

    private lazy var nextStepButton = NextStepButton(setTitle: "Далее")
    
    // MARK: - Setup Layout
    
    override func setupHierarchy() {
        self.addSubview(collectionView)
        self.addSubview(nextStepButton)
    }
    
    override func setupLayout() {

        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        nextStepButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-50)
            $0.trailing.equalTo(-20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: Private func

    private func setupIsClearCarButton(setTitle: String) -> UIButton {
        let button = UIButton(type: .system).then {
            $0.setTitle(setTitle, for: .normal)
            $0.tintColor = .black
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .lightGray
        }
        return button
    }

    // MARK: - Data Source

    typealias DataSource = RxCollectionViewSectionedReloadDataSource

    lazy var dataSource: DataSource<SectionVisualInspectionCarModel> = { createDataSource() } ()

    func createDataSource() -> DataSource<SectionVisualInspectionCarModel> {
        .init(configureCell: { [unowned self] _, collectionView, indexPath, item in

            guard let cellVisualInspectionCar = collectionView.dequeueReusableCell(
                withReuseIdentifier: "VisualInspectionCarCell",
                for: indexPath) as? VisualInspectionCarCell else { return UICollectionViewCell() }

            guard let cellVisualInspectionIsClearCar = collectionView.dequeueReusableCell(
                withReuseIdentifier: "VisualInspectionCarIsClearCell",
                for: indexPath) as? VisualInspectionCarIsClearCell else { return UICollectionViewCell() }

            if item.isClearCarTitle != nil {
                return cellVisualInspectionIsClearCar.then {
                    $0.loadDataCell(titleLabel: item.isClearCarTitle)

                    $0.clearCarYesButtonPublisher
                        .bind(to: self.clearCarYesButtonPublisher)
                        .disposed(by: disposeBag)

                    $0.clearCarNoButtonPublisher
                        .bind(to: self.clearCarNoButtonPublisher)
                        .disposed(by: disposeBag)
                }
            } else {
                return cellVisualInspectionCar.then {
                    $0.loadDataCell(titleLabel: item.titleVisualInspection, image: item.imageVisualInspection)
                }
            }
        })
    }
    
    // MARK: - Binding
    
    override func setupBindingOutput() {

        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        collectionView.rx.itemSelected
            .bind(to: tapItemCollectionView)
            .disposed(by: disposeBag)

        visualDataPublisher
            .bind(to: collectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)

        nextStepButton.rx.tap
            .bind(to: tapNextStepButtonPublisher)
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension VisualInspectionCarView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.row > 0 {
            return CGSize(width: UIScreen.main.bounds.width - 25, height: UIScreen.main.bounds.width + 20)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 25, height: 80)
        }
    }
}

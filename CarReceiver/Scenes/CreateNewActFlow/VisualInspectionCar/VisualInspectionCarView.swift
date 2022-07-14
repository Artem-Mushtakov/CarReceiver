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
    
    // MARK: - Ui element

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
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
            $0.top.equalToSuperview().offset(150)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-90)
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

    // Data Source Collection view
    lazy var dataSource = RxCollectionViewSectionedReloadDataSource<SectionVisualInspectionCarModel>(
        configureCell: { dataSource, collectionView, indexPath, item in

            guard let cellVisualInspectionCar = collectionView.dequeueReusableCell(withReuseIdentifier: "VisualInspectionCarCell", for: indexPath) as? VisualInspectionCarCell else { return UICollectionViewCell() }
            guard let  cellVisualInspectionIsClearCar = collectionView.dequeueReusableCell(withReuseIdentifier: "VisualInspectionCarIsClearCell", for: indexPath) as? VisualInspectionCarIsClearCell else { return UICollectionViewCell() }

            if item.isClearCarTitle != nil {
                return cellVisualInspectionIsClearCar
            } else {
                cellVisualInspectionCar.loadDataCell(titleLabel: item.titleVisualInspection, image: item.imageVisualInspection)
                return cellVisualInspectionCar
            }
        })
    
    // MARK: - Binding
    
    override func setupBindingOutput() {

        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        Observable.just(TestDataVisualInspectionCar.testData)
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

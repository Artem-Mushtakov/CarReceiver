//
//  FavoriteActsView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class FavoriteActsView: BaseView {
    
    // MARK: - Properties

    var favoriteDataPublisher = PublishSubject<[SectionFavoriteActsModel]>()
    var tapItemCollectionView = PublishSubject<IndexPath>()

    // MARK: - Ui elements

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.showsVerticalScrollIndicator = false
        $0.register(AllActCell.self, forCellWithReuseIdentifier: "AllActCell")
    }

    // MARK: - Data Source

    typealias DataSource = RxCollectionViewSectionedReloadDataSource

    lazy var dataSource: DataSource<SectionFavoriteActsModel> = { createDataSource() } ()

    func createDataSource() -> DataSource<SectionFavoriteActsModel> {
        .init(configureCell: { _, collectionView, indexPath, item in

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllActCell", for: indexPath) as? AllActCell

            cell?.loadDataCell(numberAct: item.numberAct,
                               nameCar: item.nameCar,
                               numberCar: item.numberCar,
                               dateOfAdmissionCar: item.dateOfAdmissionCar,
                               dateOfIssue: item.dateOfIssue)

            return cell ?? UICollectionViewCell()
        })
    }

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(collectionView)
    }

    override func setupLayout() {

        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-90)
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        collectionView.rx.itemSelected
            .bind(to: tapItemCollectionView)
            .disposed(by: disposeBag)

        favoriteDataPublisher
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: collectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FavoriteActsView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 25, height: 120)
    }
}

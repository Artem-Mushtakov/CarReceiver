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

    // MARK: - Ui elements

    private lazy var favoriteActCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.showsVerticalScrollIndicator = false
        $0.register(AllActCell.self, forCellWithReuseIdentifier: "AllActCell")
    }

    // Data Source Collection view
    lazy var favoriteActDataSource = RxCollectionViewSectionedReloadDataSource<SectionFavoriteActsModel>(
        configureCell: { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllActCell", for: indexPath) as? AllActCell

            cell?.loadDataCell(numberAct: item.numberAct,
                               nameCar: item.nameCar,
                               numberCar: item.numberCar,
                               dateOfAdmissionCar: item.dateOfAdmissionCar,
                               dateOfIssue: item.dateOfIssue)

            return cell ?? UICollectionViewCell()
        })

    // MARK: - Setup Layout

    override func setupHierarchy() {
        self.addSubview(favoriteActCollectionView)
    }

    override func setupLayout() {

        favoriteActCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-90)
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        favoriteActCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        Observable.just(TestDataFavorite.TestDataFavorite)
            .bind(to: favoriteActCollectionView.rx.items(dataSource: self.favoriteActDataSource))
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

enum TestDataFavorite {

    static let TestDataFavorite = [SectionFavoriteActsModel(header: "",
                                              items: [
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                FavoriteActsModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022")])]
}


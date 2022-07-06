//
//  AllActsView.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 21.06.2022.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

final class AllActsView: BaseView {

    // MARK: - Properties

    var tapBarButtonItemPublisher = PublishSubject<Void>()
    
    // MARK: - Ui elements

    lazy var barButtonItem = NextStepButton(setTitle: "Создать новый АКТ").then {
        $0.frame.size.width = 200
        $0.backgroundColor = .lightText
        $0.layer.masksToBounds = false
    }

    private lazy var allActCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.showsVerticalScrollIndicator = false
        $0.register(AllActCell.self, forCellWithReuseIdentifier: "AllActCell")
    }

    // Data Source Collection view
    lazy var allActDataSource = RxCollectionViewSectionedReloadDataSource<SectionAllActModel>(
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
        self.addSubview(allActCollectionView)
    }

    override func setupLayout() {

        allActCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-90)
        }
    }

    // MARK: - Binding

    override func setupBindingOutput() {

        barButtonItem.rx.tap
            .bind(to: tapBarButtonItemPublisher)
            .disposed(by: disposeBag)

        allActCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        Observable.just(TestData.testData)
            .bind(to: allActCollectionView.rx.items(dataSource: self.allActDataSource))
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AllActsView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 25, height: 120)
    }
}

enum TestData {

    static let testData = [SectionAllActModel(header: "",
                                              items: [
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022"),
                                                AllActModel(numberAct: "5000",
                                                            nameCar: "Subaru Impreza WRX",
                                                            numberCar: "A777AA777",
                                                            dateOfAdmissionCar: "22.02.2022",
                                                            dateOfIssue: "23.03.2022")])]
}

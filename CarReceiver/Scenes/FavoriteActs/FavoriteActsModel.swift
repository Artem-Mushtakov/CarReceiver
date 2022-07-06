//
//  FavoriteActsModel.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 06.07.2022.
//

import UIKit
import RxDataSources

struct FavoriteActsModel {
    var numberAct: String
    var nameCar: String
    var numberCar: String
    var dateOfAdmissionCar: String
    var dateOfIssue: String
}

struct SectionFavoriteActsModel {
  var header: String
  var items: [Item]
}

extension SectionFavoriteActsModel: SectionModelType {
  typealias Item = FavoriteActsModel

   init(original: SectionFavoriteActsModel, items: [Item]) {
    self = original
    self.items = items
  }
}
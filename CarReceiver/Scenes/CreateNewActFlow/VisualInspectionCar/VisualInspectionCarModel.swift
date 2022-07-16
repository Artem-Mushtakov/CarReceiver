//
//  VisualInspectionCarModel.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 11.07.2022.
//

import UIKit
import RxDataSources

struct VisualInspectionCarModel {
    var isClearCarTitle: String?
    var titleVisualInspection: String?
    var imageVisualInspection: UIImage?
}

struct SectionVisualInspectionCarModel {
  var header: String
  var items: [Item]
}

extension SectionVisualInspectionCarModel: SectionModelType {
  typealias Item = VisualInspectionCarModel

   init(original: SectionVisualInspectionCarModel, items: [Item]) {
    self = original
    self.items = items
  }
}

enum TestDataVisualInspectionCar {

    static let testData = [SectionVisualInspectionCarModel(header: "", items: [
        VisualInspectionCarModel(
            isClearCarTitle: "Автомобиль чистый?"),
        VisualInspectionCarModel(
            titleVisualInspection: "1. Вид спереди",
            imageVisualInspection: .add),
        VisualInspectionCarModel(
            titleVisualInspection: "2. Вид справа",
            imageVisualInspection: .add),
        VisualInspectionCarModel(
            titleVisualInspection: "3. Вид сзади",
            imageVisualInspection: .add),
        VisualInspectionCarModel(
            titleVisualInspection: "4. Вид слева",
            imageVisualInspection: .add),
        VisualInspectionCarModel(
            titleVisualInspection: "5. Вид сверху",
            imageVisualInspection: .add)])]
}

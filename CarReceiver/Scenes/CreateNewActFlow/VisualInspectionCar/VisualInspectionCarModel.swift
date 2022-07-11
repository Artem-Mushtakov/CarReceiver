//
//  VisualInspectionCarModel.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 11.07.2022.
//

import UIKit
import RxDataSources

struct VisualInspectionCarModel {
    var titleVisualInspection: String
    var imageVisualInspection: UIImage
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

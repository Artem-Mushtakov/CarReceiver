//
//  AllActModel.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 06.07.2022.
//

import UIKit
import RxDataSources

struct AllActModel {
    var numberAct: String
    var nameCar: String
    var numberCar: String
    var dateOfAdmissionCar: String
    var dateOfIssue: String
}

struct SectionAllActModel {
  var header: String
  var items: [Item]
}

extension SectionAllActModel: SectionModelType {
  typealias Item = AllActModel

   init(original: SectionAllActModel, items: [Item]) {
    self = original
    self.items = items
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


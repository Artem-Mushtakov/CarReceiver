//
//  UINavigationController+Extension.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 03.07.2022.
//

import UIKit

extension UINavigationController {
    
    func addCustomBackButton(title: String = "Back") {
        let backButton = UIBarButtonItem()
        backButton.title = title
        navigationBar.topItem?.backBarButtonItem = backButton
    }
}

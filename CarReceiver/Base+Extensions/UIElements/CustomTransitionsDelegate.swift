//
//  CustomTransitionsDelegate.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 27.06.2022.
//

import UIKit

class CustomTransitionsDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransitionsAnimates()
    }
}

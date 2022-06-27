//
//  CustomTransitionsAnimates.swift
//  CarReceiver
//
//  Created by Artem Mushtakov on 27.06.2022.
//

import UIKit

class CustomTransitionsAnimates: NSObject, UIViewControllerAnimatedTransitioning {

    private let durationAnimatedTransition: TimeInterval = 1

    /// Time animated transitions view controllers
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return durationAnimatedTransition
    }

    /// Setup animated transitions view controllers
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        /// From view controller
        let firstViewController = transitionContext.viewController(forKey: .from)
        guard let fromViewController = firstViewController else { return }

        /// To view controller
        let lastViewController = transitionContext.viewController(forKey: .to)
        guard let toViewController = lastViewController else { return }
        toViewController.view.alpha = 0

        /// Container view where the animation takes place
        let containerView = transitionContext.containerView

        containerView.addSubview(toViewController.view)

        UIView.animateKeyframes(withDuration: durationAnimatedTransition, delay: 0, options: .allowUserInteraction) {

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: self.durationAnimatedTransition / 2) {
                fromViewController.view.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: self.durationAnimatedTransition / 2, relativeDuration: self.durationAnimatedTransition / 2) {
                toViewController.view.alpha = 1
            }
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}

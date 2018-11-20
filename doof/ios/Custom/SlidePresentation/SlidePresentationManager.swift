//
//  SlidePresentationManager.swift
//  doof
//
//  Created by Emerson Victor on 14/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class SlidePresentationManager: NSObject {
    var direction = PresentationDirection.bottom
}

// MARK: - UIViewControllerTransitioningDelegate
extension SlidePresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let presentationController = SlidePresentationController(presentedViewController: presented,
                                                                   presenting: presenting,
                                                                   direction: direction)
        return presentationController
    }
}

//
//  UIKitExtensions.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/29/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

extension UIView {
    
    //The screen's view must call this to ensure frames have the corret relativity
    func sharedElementTransition(from initialView: UIView, to finalView: UIView, duration: TimeInterval = 0.3, completion: ((Bool) -> Swift.Void)? = nil) {
        let scaleX = finalView.frame.width / initialView.frame.width
        let scaleY = finalView.frame.height / initialView.frame.height
        //Ensure view is contained in parent before animating
        if !self.subviews.contains(initialView) {
          self.addSubview(initialView)
        }
        initialView.alpha = 0.5
        UIView.animate(withDuration: duration, animations: {
            initialView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
            initialView.center = finalView.center
            initialView.alpha = 1.0
            initialView.layer.zPosition = 1
        }, completion: completion)
    }
    
}

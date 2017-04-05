//
//  SignDetailView.swift
//  RallyGenius
//
//  Created by Barry Bryant on 4/4/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation
import UIKit

final class SignDetailView: UIView {
    
    @IBOutlet var signImage: UIImageView!
    @IBOutlet var signNameLabel: UILabel!
    @IBOutlet var signClassLabel: UILabel!
    @IBOutlet var signDescriptionText: UITextView!
    
    func configure(with sign: Sign) {
        signImage.image = UIImage(named: sign.name)
        signNameLabel.text = "Sign \(sign.name)"
        signClassLabel.text = sign.getClass().name
        signDescriptionText.text = sign.description
    }
    
    func viewWillAppear() {
        signImage.alpha = 0.0
        signDescriptionText.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func viewDidAppear() {
        signImage.alpha = 1.0
        self.backgroundColor = UIColor.white
    }
    
    func viewWillDissapear() {
        signImage.alpha = 0.0
        self.backgroundColor = UIColor.clear
    }
    
}

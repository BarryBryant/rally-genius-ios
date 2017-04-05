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
    @IBOutlet var signDescriptionText: UILabel!
    
    func configure(with sign: Sign) {
        signImage.image = UIImage(named: "\(sign.number)")
        signNameLabel.text = "Sign \(sign.number)"
        signClassLabel.text = sign.getClass().name
        signDescriptionText.text = sign.description
    }
    
    func viewWillAppear() {
        signImage.alpha = 0.0
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

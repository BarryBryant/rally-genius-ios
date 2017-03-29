//
//  DetailViewController.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var sign: Sign!
    
    override func viewDidLoad() {
        guard signImage != nil, descriptionLabel != nil, sign != nil else { return }
        descriptionLabel.text = sign.description
        signImage.image = UIImage(named: sign.name)
    }
    
    func configure(with sign: Sign) {
        self.sign = sign
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

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
    @IBOutlet weak var actionBar: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    var sign: Sign!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signImage.alpha = 0.0
        actionBar.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        signImage.alpha = 1.0
        actionBar.alpha = 1.0
        backButton.alpha = 1.0
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        actionBar.alpha = 0.0
        signImage.alpha = 0.0
        self.view.backgroundColor = UIColor.clear
    }
    
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

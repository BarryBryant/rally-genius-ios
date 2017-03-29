//
//  CollectionViewCell.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var signImage: UIImageView?
    @IBOutlet weak var name: UILabel?
    
    var sign: Sign? {
        didSet {
            if let sign = sign {
                signImage?.image = UIImage(named: sign.name)
                name?.text = sign.name
            }
        }
    }
    
    func configure(for sign: Sign) {
        self.sign = sign
        self.signImage?.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        name?.text = ""
        signImage?.image = nil
    }
}

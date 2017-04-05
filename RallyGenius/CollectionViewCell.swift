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
    
    
    func configure(for sign: Sign) {
        signImage?.image = UIImage(named: "\(sign.number)")
        name?.text = "\(sign.number)"
    }
    
    override func prepareForReuse() {
        name?.text = ""
        signImage?.image = nil
    }
}

//
//  SectionHeaderView.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/29/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel?
    
    var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }
        
}

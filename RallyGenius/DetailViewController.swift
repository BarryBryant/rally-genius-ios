//
//  DetailViewController.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    

    @IBOutlet weak var actionBar: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var detailView: SignDetailView!
    @IBOutlet weak var scrollView: UIScrollView!

    
    var sign: Sign!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.configure(with: sign)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailView.viewWillAppear()
        actionBar.alpha = 0.0
        self.view.backgroundColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailView.viewDidAppear()
        actionBar.alpha = 1.0
        backButton.alpha = 1.0
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        detailView.viewWillDissapear()
        actionBar.alpha = 0.0
        self.view.backgroundColor = UIColor.clear
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: detailView.frame.width, height: detailView.frame.height)
    }
    
    func configure(with sign: Sign) {
        self.sign = sign
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

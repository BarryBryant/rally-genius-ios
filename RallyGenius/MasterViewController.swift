//
//  MasterViewController.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

final class MasterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var backButton: UIButton?
    
    fileprivate var repo = SignRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle(for: CollectionViewCell.self))
        collectionView?.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rallyClass = RallyClass(rawValue: section)
        return repo.getSignsForRallyClass(rallyClass).count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
        let title = RallyClass(rawValue: indexPath.section).name
        sectionHeaderView.title = title
        return sectionHeaderView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let sign = repo.getSignForIndexPath(indexPath)
        cell.configure(for: sign)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sign = repo.getSignForIndexPath(indexPath)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.configure(with: sign)
        present(detailViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width / 3.0
        let height = width * 17 / 22
        return CGSize(width: width, height: height)
    }

}

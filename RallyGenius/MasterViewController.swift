//
//  MasterViewController.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

final class MasterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var placeholder: UIView!
    
    fileprivate var imageForAnimatingCell: UIImageView!
    fileprivate var indexPathAnimatedFrom: IndexPath!
    
    fileprivate var repo: SignRepository = JSONSignRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle(for: CollectionViewCell.self))
        collectionView?.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: {_ in
            self.collectionView.collectionViewLayout.invalidateLayout()
        })        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rallyClass = RallyClass(rawValue: section)
        return repo.getSignsFor(rallyClass: rallyClass).count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
        let title = RallyClass(rawValue: indexPath.section).name
        sectionHeaderView.title = title
        return sectionHeaderView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let sign = repo.getSignFor(indexPath: indexPath)
        cell.configure(for: sign)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        animateSelectedItem(collectionView, didSelectItemAt: indexPath)
        let sign = repo.getSignFor(indexPath: indexPath)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.configure(with: sign)
        present(detailViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width / 3.0) - 2
        let height = width * 17 / 22
        return CGSize(width: width, height: height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.alpha = 1.0
        omegaBombLoadAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.3) {
            self.collectionView.alpha = 0.0
        }
    }
    
    fileprivate func animateSelectedItem(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let placeholder = placeholder, let attributes = collectionView.layoutAttributesForItem(at: indexPath) else { return }
        
        let sign = repo.getSignFor(indexPath: indexPath)
        indexPathAnimatedFrom = indexPath
        
        //generate the view to animate relative to the superview
        let frameInSuperView = collectionView.convert(attributes.frame, to: self.view)
        imageForAnimatingCell = UIImageView(frame: frameInSuperView)
        imageForAnimatingCell.image = UIImage(named: "\(sign.number)")
        self.view.sharedElementTransition(from: imageForAnimatingCell, to: placeholder)
        
        UIView.animate(withDuration: 0.3) {
            self.backButton?.alpha = 1.0
        }
    }
    
    fileprivate func omegaBombLoadAnimation() {
        UIView.animate(withDuration: 0.3) { self.backButton.alpha = 0.0 }
        guard let placeholderImage = imageForAnimatingCell, let indexPathAnimatedFrom = indexPathAnimatedFrom, let attributes = collectionView.layoutAttributesForItem(at: indexPathAnimatedFrom) else { return }
        
        let frameInSuperView = collectionView.convert(attributes.frame, to: self.view)
        let centerX = frameInSuperView.origin.x + (frameInSuperView.size.width / 2)
        let centerY = frameInSuperView.origin.y + (frameInSuperView.size.height / 2)
        let scaleX = attributes.frame.width / placeholderImage.frame.width
        let scaleY = attributes.frame.height / placeholderImage.frame.height
        
        UIView.animate(withDuration: 0.3, animations: {
            self.imageForAnimatingCell.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
            self.imageForAnimatingCell.center = CGPoint(x: centerX, y: centerY)
            self.imageForAnimatingCell.alpha = 0.0
        }, completion: { success in
            self.imageForAnimatingCell.removeFromSuperview()
            self.imageForAnimatingCell = nil
        })
        
    }
    
}

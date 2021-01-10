//
//  GallaryViewController.swift
//  CleanArchitecture
//
//  Created by richa on 06/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import UIKit

class GallaryViewController: UIViewController {
    public var gallaryViewModel: GallaryViewModel?
    private var collectionView: UICollectionView?
    private var dataSource: [Result]?
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: UICollectionViewFlowLayout())
        let cellWidth : CGFloat = collectionView?.frame.size.width ?? 60 / 2.0
        let cellheight : CGFloat = collectionView?.frame.size.height ?? 60 - 2.0
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView?.setCollectionViewLayout(layout, animated: true)
        collectionView?.register(GallaryCustomCell.self, forCellWithReuseIdentifier: GallaryCustomCell.identifier)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView ?? UICollectionView())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gallaryViewModel?.getAPIData(param: ["client_id":Constants.APIKeys.kClientKey,"page" : 1, "query" : "dog"], completion: { (model, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if let modelUW = model {
                    self.dataSource = modelUW.results
                    DispatchQueue.main.async {
                       self.collectionView?.reloadData()
                    }
                }
            }
        })
    }
}



extension GallaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: GallaryCustomCell.identifier, for: indexPath) as? GallaryCustomCell
        let result = self.dataSource?[indexPath.row]
        myCell?.configure(imageURL: result?.urls.small ?? "", title: result?.user.name ?? "")
        return myCell ?? UICollectionViewCell()
    }
}

extension GallaryViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

extension GallaryViewController: UICollectionViewDelegateFlowLayout
{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth : CGFloat = self.view.frame.size.width/2 - 15
        let cellheight : CGFloat = self.view.frame.size.width/2 - 15

        return CGSize(width: cellWidth , height:  cellheight)
    }
}

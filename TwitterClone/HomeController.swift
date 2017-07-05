//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by Othman Mashaab on 04/07/2017.
//  Copyright © 2017 Othman Mashaab. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class WordCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "TEst Test test"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    func setupViews(){
        backgroundColor = .orange
        addSubview(myLabel)
        myLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        myLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive=true
        myLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive=true
        myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive=true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let reuseIdentifier = "Cell"
    let headerIdentifier = "Header"
    let footerIdentifier = "Footer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .gray
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
            header.backgroundColor = .black
            return header
        } else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath)
            footer.backgroundColor = .black
            return footer
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

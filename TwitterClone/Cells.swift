//
//  Cells.swift
//  TwitterClone
//
//  Created by Othman Mashaab on 04/07/2017.
//  Copyright © 2017 Othman Mashaab. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 40, g: 220, b: 255)

class UserHeader: DatasourceCell{
    override func setupViews() {
        super.setupViews()
       // backgroundColor = .green
        addSubview(headerLabel)
        
        headerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 18, bottomConstant: 1, rightConstant: 1, widthConstant: 255, heightConstant: 55)
    }
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = "Who To Follow"
            // label.translatesAutoresizingMaskIntoConstraints=false
            label.font=UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .gray
            return label
        }()
    
    
 
}

class UserFooter: DatasourceCell{
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden=false
        addSubview(footerLabel)
        
        footerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 18, bottomConstant: 1, rightConstant: 1, widthConstant: 295, heightConstant: 55)
        
    }
    
    let footerLabel: UILabel = {
    let label = UILabel()
    label.text = "Show More"
    label.textColor = twitterBlue
    label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
}

class UserCell: DatasourceCell{
    
    override var datasourceItem: Any?{
        didSet{
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.name
            usernameLabel.text = "@\(user.username)"
            bioTextView.text = user.bioText
            profileImage.image = user.userImage
        }
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Othman Alamoudi"
       // label.translatesAutoresizingMaskIntoConstraints=false
        label.font=UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "othman")
        imageView.layer.cornerRadius = 14
        
        imageView.clipsToBounds=true
        return imageView
        
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@username"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "iOS Developer, and front end Web. more skills such as: JavaScript,Css,html,Nod.JS,SQL and the lovely Swift! <3 "
        textView.backgroundColor = .clear
        textView.layer.borderWidth = 0.3
        let grayColor: UIColor = UIColor.gray
        textView.layer.borderColor = grayColor.cgColor
        textView.layer.cornerRadius = 4
        return textView
    }()
    
    let followButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //button.setImage(#imageLiteral(resourceName: "add2"), for: .normal)
        //button.setBackgroundImage(#imageLiteral(resourceName: "add2"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 1, left: -58, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 1, left: 40, bottom: 0, right: 0)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: -2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -1, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}

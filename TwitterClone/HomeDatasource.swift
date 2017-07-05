//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Othman Mashaab on 04/07/2017.
//  Copyright © 2017 Othman Mashaab. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource{
    
    let user: [User] = {
       
        let brainUser = User(name: "King",username: "TTT", bioText: "I love my life", userImage: #imageLiteral(resourceName: "othman"))
        
        let user2User = User(name: "Reou", username: "Peope", bioText: "Trying this shit", userImage: #imageLiteral(resourceName: "add"))
        
        return [brainUser,user2User]
    }()
    let words = ["Othman Alamoudi","user2","user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return user.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return user[indexPath.item]
    }
}


//
//  ATBaseTableViewCell.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/26.
//  Copyright © 2020 Mercy. All rights reserved.
//

import UIKit
import Reusable
class ATBaseTableViewCell: UITableViewCell, Reusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}

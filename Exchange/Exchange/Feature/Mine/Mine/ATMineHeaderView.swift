//
//  ATMineHeaderView.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/26.
//  Copyright © 2020 Mercy. All rights reserved.
//

import UIKit

class ATMineHeaderView: UIView {

    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
        sexTypeDidChange()
    }
    
    func sexTypeDidChange() {
        let sexType = UserDefaults.standard.integer(forKey: String.UDKey_sexType)
        if 1 == sexType {
            bgImageView.image = UIImage(named: "mine_bg_for_boy")
        } else {
            bgImageView.image = UIImage(named: "mine_bg_for_girl")
        }
        
    }
}

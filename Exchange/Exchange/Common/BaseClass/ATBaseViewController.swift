//
//  ATBaseViewController.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/25.
//  Copyright © 2020 Mercy. All rights reserved.
//

import UIKit
import SnapKit
import Reusable

class ATBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavigationBar()
    }
    
    func configUI() {}
    
    func configNavigationBar() {
        guard let navCtr = navigationController else { return }
        
        if navCtr.visibleViewController == self {
            navCtr.barStyle(.theme)
            navCtr.disablePopGesture = false
            navCtr.setNavigationBarHidden(false, animated: true)
            if navCtr.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), style: .plain, target: self, action: #selector(pressBack))
//                    UIBarButtonItem(image: UIImage(named: "nav_back_white"),
//                                                                   target: self,
//                                                                   action: #selector(pressBack))
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}

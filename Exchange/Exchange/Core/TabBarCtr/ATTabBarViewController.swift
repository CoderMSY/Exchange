//
//  ATTabBarViewController.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/24.
//  Copyright © 2020 Mercy. All rights reserved.
//

import UIKit

class ATTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let onePageVC = UIViewController()
        addChildViewController(onePageVC, title: "首页", image: UIImage(named: "tab_home"), selectedImage: UIImage(named: "tab_home_S"))
        
        let twoPageVC = UIViewController()
        addChildViewController(twoPageVC, title: "分类", image: UIImage(named: "tab_class"), selectedImage: UIImage(named: "tab_class_S"))
        
        let threePageVC = UIViewController()
        addChildViewController(threePageVC, title: "书架", image: UIImage(named: "tab_book"), selectedImage: UIImage(named: "tab_book_S"))
        
        let minePageVC = ATMineViewController()
        addChildViewController(minePageVC, title: "我的", image: UIImage(named: "tab_mine"), selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        let navCtr = ATNavigationController(rootViewController: childController)
        addChild(navCtr)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

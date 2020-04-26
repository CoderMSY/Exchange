//
//  ATMineViewController.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/25.
//  Copyright © 2020 Mercy. All rights reserved.
//

import UIKit

class ATMineViewController: ATBaseViewController {

    private lazy var myList = {
        return [
            [["icon":"mine_vip", "title": "我的VIP"],
            ["icon":"mine_coin", "title": "充值妖气币"]],
            
            [["icon":"mine_accout", "title": "消费记录"],
             ["icon":"mine_subscript", "title": "我的订阅"],
             ["icon":"mine_seal", "title": "我的封印图"]],
            
            [["icon":"mine_message", "title": "我的消息/优惠券"],
             ["icon":"mine_cashew", "title": "妖果商城"],
             ["icon":"mine_freed", "title": "在线阅读免流量"]],
            
            [["icon":"mine_feedBack", "title": "帮助中心"],
             ["icon":"mine_mail", "title": "我要反馈"],
             ["icon":"mine_judge", "title": "给我们评分"],
             ["icon":"mine_author", "title": "成为作者"],
             ["icon":"mine_setting", "title": "设置"]]
        ]
    }()
    
    private lazy var headerView: ATMineHeaderView = {
        return ATMineHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
    }()
    
    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: ATBaseTableViewCell.self)
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
        // Do any additional setup after loading the view.
        print("创建我的页面")
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view.usnp.edges).priority(.low)
            make.top.equalToSuperview()
        }
        tableView.parallaxHeader.view = headerView
        tableView.parallaxHeader.height = 200
        tableView.parallaxHeader.minimumHeight = navigationBarY
        tableView.parallaxHeader.mode = .fill
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.barStyle(.clear)
        tableView.contentOffset = CGPoint(x: 0, y: -tableView.parallaxHeader.height)
    }
}

extension ATMineViewController: UITableViewDataSource, UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= -scrollView.parallaxHeader.minimumHeight {
            navigationController?.barStyle(.theme)
            navigationItem.title = "我的"
        } else {
            navigationController?.barStyle(.clear)
            navigationItem.title = ""
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return myList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myList[section]
        
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ATBaseTableViewCell.self)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        let sectionArray = myList[indexPath.section]
        let dict: [String: String] = sectionArray[indexPath.row]
        cell.imageView?.image = UIImage(named: dict["icon"] ?? "")
        cell.textLabel?.text = dict["title"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

//
//  ViewController.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/24.
//  Copyright © 2020 Mercy. All rights reserved.
//

import UIKit

class Person: NSObject {

    fileprivate var name:String = "man"
    
    private var age:Int = 1
    
    fileprivate func printNameAndAge() {
        print("name:\(name) age:\(age)")
    }
    
    private func setNameAndAge(name:String,age:Int) {
        //xxx
    }
}

extension Person {
    func printAge() {
        //在 当前文件的 extension 中，调用private 修饰的属性没问题
        print(self.age)
    }
    
    func printName() {
      //在 当前文件的 extension 中，调用fileprivate 修饰的属性没问题
        print(self.name)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        print(p.name)
        p.printAge()
        p.printName()
        
        p.printNameAndAge()
        //用private修饰的方法不能够被调用到
//        p.setNameAndAge
    }
}


//
//  ATGlobalLayout.swift
//  Exchange
//
//  Created by SimonMiao on 2020/4/26.
//  Copyright © 2020 Mercy. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

//MARK: SnapKit
extension ConstraintView {
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

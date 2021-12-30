//
//  UIScrollView+Extension.swift
//  EasyMyCleaner
//
//  Created by Nguyen Trung on 30/12/2021.
//

import UIKit

extension UIScrollView {
    
    var currentPage: Int {
        let width = self.frame.width
        let page = Int(round(self.contentOffset.x/width))
        return page
    }

}

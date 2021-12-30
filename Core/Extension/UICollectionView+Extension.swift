//
//  UICollectionView+Extension.swift
//  EasyScanner
//
//  Created by Trung on 11/08/2021.
//

import Foundation
import UIKit
extension UICollectionView {
    func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData()}, completion: { _ in completion() })
        
    }
    
    func scrollToItem(indexPath: IndexPath, at: ScrollPosition, _ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.scrollToItem(at: indexPath, at: at, animated: false)}, completion: { _ in completion() })
        
    }
}

//
//  LoadingView.swift
//  EasyScanner
//
//  Created by Trung on 20/08/2021.
//

import Foundation
import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

class WSLoadingView {
    
    class func show() {
        hide()
        guard let window = UIWindow.key else {
            return
        }
        
        let indicator = UIActivityIndicatorView()
        indicator.tag = 2521
        indicator.center = CGPoint(x: window.bounds.size.width/2, y: window.bounds.size.height/2)
        indicator.style = UIActivityIndicatorView.Style.medium
        window.addSubview(indicator)
        
        indicator.startAnimating()
    }
    
    class func hide() {
        guard let window = UIWindow.key else {
            return
        }
        if let viewWithTag = window.viewWithTag(2521) {
            viewWithTag.removeFromSuperview()
        }
        if let viewWithTag = window.viewWithTag(2125) {
            viewWithTag.removeFromSuperview()
        }
    }
    
    class func showWithMask() {
        hide()
        guard let window = UIWindow.key else {
            return
        }
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        containerView.backgroundColor = .black
        containerView.alpha = 0.2
        containerView.tag = 2125
        window.addSubview(containerView)
        let indicator = UIActivityIndicatorView(frame: CGRect.init(origin: CGPoint(x: 100, y: 100), size: CGSize.init(width: 100, height: 100)))
        indicator.color = UIColor.black
        indicator.tag = 2521
        indicator.center = CGPoint(x: containerView.bounds.size.width/2, y: containerView.bounds.size.height/2)
        indicator.style = UIActivityIndicatorView.Style.medium
        window.addSubview(indicator)
        
        indicator.startAnimating()
        
    }
    
}

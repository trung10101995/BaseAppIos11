//
//  XibView.swift
//  EasyMyCleaner
//
//  Created by Nguyen Trung on 30/12/2021.
//

import Foundation
//
//  XibView.swift
//  EasyScanner
//
//  Created by Trung on 10/08/2021.
//

import Foundation
import UIKit

extension UINib {
    func instantiate(owner: Any? = nil) -> Any? {
        return self.instantiate(withOwner: owner, options: nil).first
    }
}

extension UIView {
    static var nib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: "\(self)", bundle: bundle)
    }

    func loadFromNib() -> UIView {
        return type(of: self).nib.instantiate(owner: self) as! UIView // swiftlint:disable:this force_cast
    }
}

@IBDesignable
class XibView: UIView {

    @IBOutlet weak var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        backgroundColor = .clear

        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true

        addSubview(view)
    }
}

class XibTableViewCell: UITableViewCell {}

class XibCollectionViewCell: UICollectionViewCell {}


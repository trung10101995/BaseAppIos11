//
//  AutoSizingTableview.swift
//  KingHub
//
//  Created by Trung on 6/2/20.
//  Copyright © 2020 VivaVietNam. All rights reserved.
//

import UIKit

protocol AutoSizeTableViewDelegate: AnyObject {
    func didChangeSize(height: CGFloat)
}
class AutoSizingTableView: UITableView {
    weak var heightDelegate: AutoSizeTableViewDelegate?
    var extraHeight: CGFloat = 0.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    var heightConstraint: NSLayoutConstraint?
    private var contentSizeObserver: NSKeyValueObservation?
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        observeContentSizeChange()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        observeContentSizeChange()
    }
    private func observeContentSizeChange() {
        contentSizeObserver = observe(\.contentSize,
                                      options: [.old, .new],
                                      changeHandler: handleContentSizeChange)
    }
    private func handleContentSizeChange(tableView: AutoSizingTableView,
                                         change: NSKeyValueObservedChange<CGSize>) {
        guard let new = change.newValue else {
            return
        }
        guard let old = change.oldValue else {
            heightConstraint?.constant = new.height + extraHeight
            return
        }
        if old.height != new.height {
            heightConstraint?.constant = new.height + extraHeight
            heightDelegate?.didChangeSize(height: heightConstraint?.constant ?? 0.0)
        }
    }
    deinit {
        contentSizeObserver = nil
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if heightConstraint == nil {
            heightConstraint = self.heightAnchor.constraint(equalToConstant: 0)
            heightConstraint?.isActive = true
        }
    }
    override func removeFromSuperview() {
        super.removeFromSuperview()
        heightConstraint = nil
    }
}

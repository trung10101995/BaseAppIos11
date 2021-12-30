//
//  RegisterView+Extension.swift
//  EasyScanner
//
//  Created by Trung on 11/08/2021.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusableView {}
extension UICollectionViewCell: ReusableView {}

extension UITableView {

    func register<T>(_: T.Type) where T: UIView, T: ReusableView {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T>(_: T.Type, for indexPath: IndexPath) -> T  where T: UIView, T: ReusableView {

        let cell: T? = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
        guard let unwrappedCell = cell else { fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
        return unwrappedCell
    }
}

extension UICollectionView {

    func register<T>(_: T.Type) where T: UIView, T: ReusableView {
            register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T>(_: T.Type, for indexPath: IndexPath) -> T  where T: UIView, T: ReusableView {
        let cell: T? = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
        guard let unwrappedCell = cell else { fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
        return unwrappedCell
    }
}

//
//  UIView+AddSubviews.swift
//  login_screen_refactory
//
//  Created by Idwall Go Dev 001 on 23/03/22.
//

import Foundation
import UIKit

extension UIViewController {
    func addSubviews(_ subViews: UIView...) {
        for v in subViews {
            view.addSubview(v)
        }
    }
}

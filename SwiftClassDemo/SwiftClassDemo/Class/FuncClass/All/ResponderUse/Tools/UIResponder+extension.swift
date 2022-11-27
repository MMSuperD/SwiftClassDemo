//
//  UIResponder+extension.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/11/26.
//

import Foundation

import Foundation
import UIKit
@objc public protocol TS_UserInteraction_DataTransition {
    @objc func ts_userInteraction(info:AnyObject)
}
public extension UIResponder{
    func ts_transitionInfo(info:AnyObject?) {
        if self.conforms(to: TS_UserInteraction_DataTransition.self) {
            (self as! TS_UserInteraction_DataTransition).ts_userInteraction(info:info!)
        }else{
            self.next?.ts_transitionInfo(info:info!)
        }
    }
}

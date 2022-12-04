//
//  GCDExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 23.11.2022.
//

import UIKit

extension DispatchQueue {
    private static var onceTokens = [Int]()
    private static var intenalQueue = DispatchQueue(label: "dispatchqueue.once")
    
    public class func once(token: Int, closure: () -> Void) {
        intenalQueue.sync {
            if onceTokens.contains(token) {
                return
            } else {
                onceTokens.append(token)
            }
            closure()
        }
    }
}

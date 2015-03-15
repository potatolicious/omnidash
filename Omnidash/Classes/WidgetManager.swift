//
//  WidgetManager.swift
//  Omnidash
//
//  Created by Jerry Wong on 3/14/15.
//  Copyright (c) 2015 Jerry Wong. All rights reserved.
//

import Cocoa

struct WidgetLocation {
    let x: UInt
    let y: UInt
    let width: UInt
    let height: UInt

    init(x: UInt, y: UInt, width: UInt, height: UInt) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
}

struct Widget {
    let controller: WidgetBaseViewController
    let location: WidgetLocation

    init(controller: WidgetBaseViewController, location: WidgetLocation) {
        self.controller = controller
        self.location = location
    }
}

class WidgetManager: NSObject {
    class var sharedInstance: WidgetManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WidgetManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WidgetManager()
        }
        return Static.instance!
    }
}
